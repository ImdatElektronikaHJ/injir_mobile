class CancelableVoidFuture {
  void Function(Object)? onErrorCallback;
  void Function() onSuccessCallback;
  bool _wasCancelled = false;

  CancelableVoidFuture(Future<void> future,
      {required this.onSuccessCallback, this.onErrorCallback}) {
    future.then((_) {
      if (!_wasCancelled) {
        onSuccessCallback();
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
