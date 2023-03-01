class RestResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;

  const RestResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
