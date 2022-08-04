class Failure {
  Failure._();

  factory Failure.request({int? code, String? message}) = RequestFailure;
  factory Failure.network() = NetworkFailure;
  factory Failure.undefined({Exception? error}) = UndefinedFailure;
}

class RequestFailure extends Failure {
  RequestFailure({this.code, this.message}) : super._();
  final int? code;
  final String? message;
}

class NetworkFailure extends Failure {
  NetworkFailure() : super._();
}

class UndefinedFailure extends Failure {
  UndefinedFailure({this.error}) : super._();
  final Exception? error;
}
