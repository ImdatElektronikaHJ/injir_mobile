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

  StatefullData<String> _reviewResponse = StatefullData.empty();
  StatefullData<String> get reviewResponse => _reviewResponse;

  final _productRepository = ProductRepository();
  final _productsRepository = ProductsRepository();

  final _langController = Get.find<LanguageController>();
  final _accountController = Get.find<AccountController>();

  ///Need for clear comment after review
  final _textController = TextEditingController();
  TextEditingController get textController => _textController;

  int _currentRating = -1;
  int get currentRating => _currentRating;

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

  // void onCommentChanged(String? value) {
  //   _textController.text = value?.trim() ?? '';
  //   _textController.
  // }

  String? validateComment() {
    if (_textController.value.text.isEmpty) {
      return 'fill_field'.tr;
    } else if (_textController.value.text.length < 25 ||
        _textController.value.text.length > 100) {
      return InterpolationUtil.interpolate(
          "field_max_min_length".tr, [25, 100]);
    }
    return null;
  }

  void onPostCommentTapped() async {
    if (_accountController.accountResponse.data == null) {
      Get.showSnackbar(GetSnackBar(
        messageText: Text(
          'user_not_logged_in'.tr,
          style: Get.textTheme.subtitle1!.copyWith(color: AppColors.whiteColor),
        ),
        duration: const Duration(milliseconds: 3500),
        margin: const EdgeInsets.all(AppDimension.marginMedium),
        backgroundColor: AppColors.redColor,
        borderRadius: AppDimension.borderRadiusMedium,
      ));
    } else if (formKey.currentState!.validate()) {
      if (_currentRating < 0) {
        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            'put_rating_to_make_review'.tr,
            style:
                Get.textTheme.subtitle1!.copyWith(color: AppColors.whiteColor),
          ),
          duration: const Duration(milliseconds: 3500),
          margin: const EdgeInsets.all(AppDimension.marginMedium),
          backgroundColor: AppColors.redColor,
          borderRadius: AppDimension.borderRadiusMedium,
        ));
      } else {
        _reviewResponse = StatefullData.loading();
        update();
        try {
          final review = Review(
              name: _accountController.accountResponse.data!.firstName,
              rating: _currentRating.toDouble(),
              text: _textController.value.text);
          await _reviewRepository.postReview(review, currentId);
          _reviewResponse = StatefullData.completed('');
          Get.defaultDialog(
            barrierDismissible: false,
            title: '',
            middleText: 'thanks_for_review'.tr,
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
          ).then((value) {
            _currentRating = -1;
            formKey.currentState!.reset();
            update();
          });
        } catch (e) {
          if (kDebugMode) {
            _reviewResponse = StatefullData.error(e);
            update();
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
