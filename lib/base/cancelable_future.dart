class CancelableFuture<T> {
  void Function(Object)? onErrorCallback;
  void Function(T) onSuccessCallback;
  bool _wasCancelled = false;

  CancelableFuture(Future<T> future,
      {required this.onSuccessCallback, this.onErrorCallback}) {
    future.then((value) {
      if (!_wasCancelled) {
        onSuccessCallback(value);
      }
    }, onError: (e) {
      if (!_wasCancelled && onErrorCallback != null) {
        onErrorCallback!(e);
      }
    });
  }

  cancel() {
    _wasCancelled = true;
  }
}
