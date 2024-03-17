import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.message);
  final String message;

  Failure copyWith({String? message}) {
    return Failure(message ?? this.message);
  }

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

enum ResponseFailure {
  badRequest(
      code: 400, message: 'badRequest', failure: ServerFailure('badRequest')),
  forbidden(
      code: 403, message: 'forbidden', failure: ServerFailure('forbidden')),
  unauthorized(
      code: 401,
      message: 'unauthorized',
      failure: ServerFailure('unauthorized')),
  notFound(code: 404, message: 'notFound', failure: ServerFailure('notFound')),

  cancel(code: 701, message: 'cancel', failure: ServerFailure('cancel')),
  connectionError(
      code: 702,
      message: 'connectionError',
      failure: ServerFailure('connectionError')),
  connectionTimeout(
      code: 703,
      message: 'connectionTimeout',
      failure: ServerFailure('connectionTimeout')),
  receiveTimeout(
      code: 704,
      message: 'receiveTimeout',
      failure: ServerFailure('receiveTimeout')),
  sendTimeout(
      code: 705, message: 'sendTimeout', failure: ServerFailure('sendTimeout')),
  unknown(code: 706, message: 'unknown', failure: ServerFailure('unknown'));

  factory ResponseFailure.getByCode(int code) {
    return ResponseFailure.values.firstWhere((value) => value.code == code,
        orElse: () => ResponseFailure.unknown);
  }

  const ResponseFailure(
      {required this.code, required this.message, required this.failure});

  final int code;
  final String message;
  final Failure failure;
  Failure getFailure() {
    return ServerFailure(message);
  }
}

enum ResponseSuccess {
  success(200),
  created(201);

  const ResponseSuccess(this.code);
  final int code;
}
