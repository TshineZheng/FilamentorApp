class ServerExceptions implements Exception {
  final Uri? url;
  final int? code;
  final String? message;
  final dynamic result;

  ServerExceptions({ this.url,  this.code,  this.message,  this.result});

  @override
  String toString() {
    return message ?? '未知错误';
  }
}