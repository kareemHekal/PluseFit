
import '../../entity/error_model.dart';

class ServerError implements Exception {
  ErrorModel? errorModel;
  ServerError({
    this.errorModel,
  });
  @override
  String toString() => errorModel?.message ?? "ServerError occurred";
}

class NetworkError implements Exception {
  ErrorModel? errorModel;
  NetworkError({this.errorModel});
  @override
  String toString() => errorModel?.message ?? "NetworkError occurred";
}

class ClientError implements Exception {
  String? message;
  ClientError({
    this.message,
  });
  @override
  String toString() => message ?? "ClientError occurred";
}

class ServerSideError implements Exception {
  ErrorModel? errorModel;
  ServerSideError({
    this.errorModel,
  });
  @override
  String toString() => errorModel?.message ?? "ServerSideError occurred";
}
