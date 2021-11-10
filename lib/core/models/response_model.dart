class ResponseModel<T> {
  
  final bool _success;
  bool get isSuccess => _success;

  final bool _error;
  bool get isError => _error;

  final bool _notFound;
  bool get isNotFound => _notFound;

  T? data;
  String? message;

  ResponseModel.success({
    this.message,
    this.data
  }) :
    _success = true,
    _error = false,
    _notFound = false;

  ResponseModel.error({
    this.message
  }) :
    _success = false,
    _error = true,
    _notFound = false;

  ResponseModel.notFound({
    this.message
  }) :
    _success = false,
    _error = false,
    _notFound = true;
}