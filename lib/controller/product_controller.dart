import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/data/network/repository/product_repository.dart';
import 'package:tajir/data/network/repository/review_repository.dart';
import 'package:tajir/model/list_product.dart';
import 'package:tajir/model/product.dart';
import 'package:tajir/model/review.dart';
import 'package:tajir/theme/app_text_style.dart';
import 'package:tajir/util/interpolation_util.dart';

import '../data/network/repository/products_repository.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimension.dart';
import 'language_controller.dart';

class ProductController extends GetxController {
  final int currentId;
  final GlobalKey<FormState> formKey;
  ProductController({required this.currentId, required this.formKey});

  StatefullData<Product> _productResponse = StatefullData.empty();
  StatefullData<Product> get productResponse => _productResponse;

  StatefullData<List<ListProduct>> _relatedProducts = StatefullData.empty();
  StatefullData<List<ListProduct>> get relatedProducts => _relatedProducts;

  final _productRepository = ProductRepository();
  final _productsRepository = ProductsRepository();

  final _langController = Get.find<LanguageController>();
  final _accountController = Get.find<AccountController>();

  int _currentRating = -1;
  int get currentRating => _currentRating;

  String? _comment = '';
  String? get comment => _comment;

  final _reviewRepository = ReviewRepository();

  void _getProduct() async {
    _productResponse = StatefullData.loading();
    update();
    try {
      final response = await _productRepository.fetchProduct(currentId);
      _productResponse = StatefullData.completed(response);
      update();
    } catch (e) {
      _productResponse = StatefullData.error(e);
      update();
      if (kDebugMode) {
        print('Product controller getProduct method: $e');
      }
    }
  }

  void _getRelatedProducts() async {
    _relatedProducts = StatefullData.loading();
    update();
    try {
      final response =
          await _productsRepository.fetchRelatedProducts(currentId);
      _relatedProducts = StatefullData.completed(response);
      update();
    } catch (e) {
      _relatedProducts = StatefullData.error(e);
      update();
      if (kDebugMode) {
        print('Product controller getProduct method: $e');
      }
    }
  }

  void _langWasChanged() {
    _langController.selectedLocale.listen((p0) {
      _getProduct();
    });
  }

  void onRatingTapped() async {
    _currentRating = await Get.defaultDialog(
      title: "rate_product".tr,
      titleStyle: AppTextStyle.avenirRegular
          .copyWith(color: Get.theme.secondaryHeaderColor),
      content: SizedBox(
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  if (_currentRating != i) {
                    Get.back(result: i);
                  }
                },
                child: Container(
                  color: Get.theme.primaryColor,
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppDimension.marginSmall / 3),
                  child: Icon(
                    CupertinoIcons.star_fill,
                    color: _currentRating >= i
                        ? AppColors.amberColor
                        : AppColors.greyColor,
                    size: 30.0,
                  ),
                ),
              ),
          ],
        ),
      ),
      confirm: GestureDetector(
        onTap: () {
          Get.back(result: _currentRating);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimension.paddingLarge,
              vertical: AppDimension.paddingSmall / 2),
          decoration: BoxDecoration(
              color: AppColors.lightBlueColor,
              borderRadius:
                  BorderRadius.circular(AppDimension.borderRadiusMedium)),
          child: Text(
            'ok'.tr,
            style: AppTextStyle.avenirRegular
                .copyWith(color: Get.theme.secondaryHeaderColor),
          ),
        ),
      ),
    );
    update();
  }

  // void onRatingChanged(int rating) {
  //   if (_currentRating.value != rating) {
  //     _currentRating.value = rating;
  //   }
  // }

  void onCommentChanged(String? value) {
    _comment = value?.trim();
  }

  String? validateComment() {
    if (_comment == null || _comment!.isEmpty) {
      return 'fill_field'.tr;
    } else if (_comment!.length < 25 || _comment!.length > 100) {
      return InterpolationUtil.interpolate(
          "field_max_min_length".tr, [25, 100]);
    }
    return null;
  }

  void onPostCommentTapped() async {
    if (formKey.currentState!.validate()) {
      if (_currentRating < 0) {
        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            'Пожалуйста, поставьте рейтинг, чтобы отправить отзыв',
            style:
                Get.textTheme.subtitle1!.copyWith(color: AppColors.whiteColor),
          ),
          duration: const Duration(milliseconds: 3500),
          margin: const EdgeInsets.all(AppDimension.marginMedium),
          backgroundColor: AppColors.redColor,
          borderRadius: AppDimension.borderRadiusMedium,
        ));
      } else {
        try {
          final review = Review(
              name: _accountController.accountResponse.data!.firstName,
              rating: _currentRating.toDouble(),
              text: _comment);
          final response =
              await _reviewRepository.postReview(review, currentId);
          Get.defaultDialog(
            title: '',
            middleText: 'Спасибо за ваш отзыв!',
            middleTextStyle: AppTextStyle.avenirRegular
                .copyWith(color: Get.theme.secondaryHeaderColor),
            confirm: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingLarge,
                    vertical: AppDimension.paddingSmall / 2),
                decoration: BoxDecoration(
                    color: AppColors.lightBlueColor,
                    borderRadius:
                        BorderRadius.circular(AppDimension.borderRadiusMedium)),
                child: Text(
                  'ok'.tr,
                  style: AppTextStyle.avenirRegular
                      .copyWith(color: Get.theme.secondaryHeaderColor),
                ),
              ),
            ),
          );
        } catch (e) {
          if (kDebugMode) {
            print("Post review method: $e");
          }
        }
      }
    }
  }

  @override
  void onInit() {
    _langWasChanged();
    _getProduct();
    _getRelatedProducts();
    super.onInit();
  }
}
