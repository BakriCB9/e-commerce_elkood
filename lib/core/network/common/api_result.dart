sealed class Result<T> {}

class SuccessResult<T> extends Result<T> {
  T data;
  SuccessResult(this.data);
}

class FailureResult<T> extends Result<T> {
  String  errorMessage;
  FailureResult(this.errorMessage);
}
