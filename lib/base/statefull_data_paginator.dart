import 'package:tajir/base/statefull_data.dart';

class StatefullDataPaginator<T> {
  late Status status;

  List<T> data = [];

  dynamic error;

  StatefullDataPaginator();

  StatefullDataPaginator.loading() : status = Status.loading;

  StatefullDataPaginator.completed(this.data) : status = Status.completed;

  StatefullDataPaginator.error(this.error) : status = Status.error;

  StatefullDataPaginator.empty() : status = Status.none;

  void addItems(List<T> items) {
    data.addAll(items);
    status = Status.completed;
  }

  void loading() {
    status = Status.loading;
  }

  void onError(dynamic error) {
    this.error = error;
    status = Status.error;
  }

  @override
  String toString() {
    return "$status";
  }
}
