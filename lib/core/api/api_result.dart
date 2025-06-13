sealed class ApiResult<T> {}

class SuccessApiResult<T> extends ApiResult<T> {
  final T? data;
  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  final Exception exception;
  ErrorApiResult(this.exception);
}