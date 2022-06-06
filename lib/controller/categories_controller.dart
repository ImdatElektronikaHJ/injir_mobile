import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/language_controller.dart';
import 'package:tajir/data/network/repository/categories_repository.dart';
import 'package:tajir/model/list_category.dart';

class CategoriesController extends GetxController {
  StatefullData<List<ListCategory>> _categoriesResponse = StatefullData.empty();
  StatefullData<List<ListCategory>> get categoriesResponse =>
      _categoriesResponse;

  final _categoriesRepository = CategoriesRepository();

  final _langController = Get.find<LanguageController>();

  void retry() async {
    _getCategories();
  }

  void _getCategories() async {
    _categoriesResponse = StatefullData.loading();
    update();
    try {
      final response = await _categoriesRepository.fetchCategories();
      _categoriesResponse = StatefullData.completed(response);
      update();
    } catch (e) {
      _categoriesResponse = StatefullData.error(e);
      update();
    }
  }

  void _langWasChanged() {
    _langController.selectedLocale.listen((p0) {
      _getCategories();
    });
  }

  @override
  void onInit() {
    _getCategories();
    _langWasChanged();
    super.onInit();
  }

  @override
  void dispose() {
    _langController.selectedLocale.close();
    super.dispose();
  }
}
