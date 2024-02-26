class BaseError{
  String errMsg;

  BaseError({required this.errMsg});
}
class ServerError extends BaseError{
  ServerError({required super.errMsg});
}