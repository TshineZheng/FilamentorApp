class ApiResult<T> {
  const ApiResult({
    required this.code,
    required this.data,
    this.message,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return ApiResult<T>(
      code: json['code'],
      message: json['message'],
      data: fromJsonT(json['data']),
    );
  }

  ///接口调用成功的code码
  static const success = 200;
  static const unknown = -1;
  final int code;
  final T data;
  final String? message;

  ///业务接口执行成功
  bool get isSuccess => code == success;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) => {'code': code, 'message': message, 'data': toJsonT(data)};

  @override
  String toString() => 'ApiResult{code: $code, data: $data, message: $message}';
}
