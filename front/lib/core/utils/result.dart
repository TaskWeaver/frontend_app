abstract class Result<T> {
  static Result<T> failure<T>(Exception error) => Failure<T>(error);

  static Result<T> success<T>(T value) => Success<T>(value);

  T getOrThrow() {
    return this is Success<T>
        ? (this as Success<T>).value
        : throw (this as Failure).error;
  }

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Exception e) onFailure,
  }) {
    return this is Success
        ? onSuccess((this as Success<T>).value)
        : onFailure((this as Failure).error);
  }
}

class Success<T> extends Result<T> {
  Success(this.value);
  final T value;
}

class Failure<T> extends Result<T> {
  Failure(this.error);
  final Exception error;
}
