abstract class Result<T> {
  static Result<T> error<T>(Exception error) => Error<T>(error);

  static Result<T> success<T>(T value) => Success<T>(value);
}

class Success<T> extends Result<T> {
  Success(this.value);
  final T value;
}

class Error<T> extends Result<T> {
  Error(this.exception);
  final Exception exception;
}