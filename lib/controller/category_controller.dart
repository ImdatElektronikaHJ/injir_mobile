import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/language_controller.dart';
import 'package:tajir/data/network/repository/products_repository.dart';
import 'package:tajir/model/category.dart';
import 'package:tajir/screen/product/product_screen.dart';

import '../base/statefull_data_paginator.dart';
import '../const/app_routes.dart';
import '../data/network/repository/category_repository.dart';
import '../model/list_product.dart';
import '../screen/category/category_screen.dart';

class CategoryController extends GetxController {
  final int currentId;
  CategoryController({required this.currentId});

  StatefullData<CategoryModel> _categoryResponse = StatefullData.empty();
  StatefullData<CategoryModel> get categoryResponse => _categoryResponse;

  StreamSubscription<List<ListProduct>>? _productsRequestSubscription;
  StatefullDataPaginator<ListProduct> _responseProductsPaginator =
      StatefullDataPaginator.empty();

  StatefullDataPaginator<ListProduct> get categoryProducts =>
      _responseProductsPaginator;

  final _categoryRepository = CategoryRepository();
  final _productsRepository = ProductsRepository();

  final _langController = Get.find<LanguageController>();

  int _currentPage = 1;
  bool _reachedTheEnd = false;

  void retry() {
    _getCategory();
  }

  void retryFetchProducts() {
    _fetchProducts();
  }

  void paginateToNextPage({int limitPerPage = 10}) {
    if (_responseProductsPaginator.status != Status.loading &&
        _responseProductsPaginator.data.isNotEmpty) {
      _currentPage++;
      _fetchNextPage(limitPerPage: limitPerPage);
    }
  }

  void _getCategory() async {
    _categoryResponse = StatefullData.loading();
    update();
    try {
      final response = await _categoryRepository.fetchCategory(id: currentId);
      _categoryResponse = StatefullData.completed(response);
      update();
    } catch (e) {
      _categoryResponse = StatefullData.error(e);
      if (kDebugMode) {
        print(e);
      }
      update();
    }
  }

  void refreshCategoryProducts(
      {required int categoryId, int limitPerPage = 10}) {
    if (_responseProductsPaginator.status != Status.loading) {
      _getCategory();
      _fetchProducts(limitPerPage: limitPerPage);
    }
  }

  void _fetchNextPage({int limitPerPage = 10}) {
    if (!_reachedTheEnd) {
      if (_responseProductsPaginator.status != Status.loading) {
        _responseProductsPaginator.loading();
        update();
        _productsRequestSubscription = _productsRepository
            .fetchCategoryProducts(
              categoryId: currentId,
              limit: limitPerPage,
              page: _currentPage,
            )
            .asStream()
            .listen((data) {
          _reachedTheEnd = data.isEmpty;
          _responseProductsPaginator.addItems(data);
          update();
        }, onError: (e) {
          _currentPage = 1;
          _responseProductsPaginator.onError(e);
          if (kDebugMode) {
            print('Products fetch pagination provider: $e');
          }
          update();
        }, onDone: () {}, cancelOnError: true);
      }
    }
  }

  void _fetchProducts({int limitPerPage = 10}) {
    _reachedTheEnd = false;
    _currentPage = 1;
    if (_productsRequestSubscription != null) {
      _productsRequestSubscription!.cancel();
    }
    if (_responseProductsPaginator.status != Status.loading) {
      _responseProductsPaginator = StatefullDataPaginator.loading();
      update();
    }
    _productsRequestSubscription = _productsRepository
        .fetchCategoryProducts(
            categoryId: currentId, limit: limitPerPage, page: _currentPage)
        .asStream()
        .listen((data) {
      _responseProductsPaginator = StatefullDataPaginator.completed(data);
      update();
    }, onError: (e) {
      _responseProductsPaginator = StatefullDataPaginator.error(e);

      if (kDebugMode) {
        print('Products fetch controller: $e');
      }
      update();
    }, onDone: () {
      update();
    }, cancelOnError: true);
  }

  void onCategoryTapped(int id) {
    Get.toNamed(AppRoutes.categoryRoute,
        id: NestedNavigationIds.categories,
        arguments: {categoryId: id},
        preventDuplicates: false);
  }

  void _langWasChanged() {
    _langController.selectedLocale.listen((p0) {
      _fetchProducts();
      _getCategory();
    });
  }

  void onProductTapped(int id) {
    Get.toNamed(AppRoutes.productRoute,
        id: NestedNavigationIds.categories, arguments: {productId: id});
  }

  @override
  void onInit() {
    _langWasChanged();
    _getCategory();
    _fetchProducts();
    super.onInit();
  }
}
