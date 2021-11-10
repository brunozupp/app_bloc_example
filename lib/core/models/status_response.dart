import 'package:app_bloc_example/core/models/response_model.dart';

class StatusResponse {
  
  final bool _success;
  bool get isSuccess => _success;

  final bool _error;
  bool get isError => _error;

  final bool _notFound;
  bool get isNotFound => _notFound;

  String? message;

  StatusResponse.fromResponseModel({
    required ResponseModel responseModel
  }) :
    message = responseModel.message,
    _success = responseModel.isSuccess,
    _error = responseModel.isError,
    _notFound = responseModel.isNotFound;

  StatusResponse.success({
    this.message,
  }) :
    _success = true,
    _error = false,
    _notFound = false;

  StatusResponse.error({
    this.message
  }) :
    _success = false,
    _error = true,
    _notFound = false;

  StatusResponse.notFound({
    this.message
  }) :
    _success = false,
    _error = false,
    _notFound = true;
}