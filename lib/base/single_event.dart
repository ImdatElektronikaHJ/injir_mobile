class SingleEvent<T> {
  late bool _isReceived;
  T? _data;

  SingleEvent(T? data) {
    _isReceived = false;
    _data = data;
  }

  bool get isReceived => _isReceived;

  T? getData({bool updateFlag = true}) {
    if (updateFlag) {
      _isReceived = true;
    }
    return _data;
  }

  @override
  String toString() {
    return "Receive status: $isReceived";
  }
}
