enum Status { loading, completed, error, none }

class StatefullData<T> {
  Status status;
  T? data;
  dynamic error;

  StatefullData.loading() : status = Status.loading;

  StatefullData.completed(this.data) : status = Status.completed;

  StatefullData.error(this.error) : status = Status.error;

  StatefullData.empty() : status = Status.none;

  @override
  String toString() {
    return "$status";
  }
}
