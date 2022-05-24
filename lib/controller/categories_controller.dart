import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/data/network/repository/categories_repository.dart';
import 'package:tajir/model/list_category.dart';

class CategoriesController extends GetxController {
  StatefullData<List<ListCategory>> categoriesResponse = StatefullData.empty();

  final _categoriesRepository = CategoriesRepository();

  void _getCategories() async {
    categoriesResponse = StatefullData.loading();
    update();
    try {
      final response = await _categoriesRepository.fetchCategories();
      categoriesResponse = StatefullData.completed(response);
      update();
    } catch (e) {
      categoriesResponse = StatefullData.error(e);
      update();
      print(e);
    }
  }

  @override
  void onInit() {
    _getCategories();
    super.onInit();
  }
}
