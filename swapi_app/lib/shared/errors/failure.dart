class Failure implements Exception {
  final String? status;
  final String? code;
  final String? message;
  final int statusCode;

  Failure({
    this.status,
    this.code,
    this.message,
    required this.statusCode,
  });

  factory Failure.fromMap(Map<String, dynamic> map) => Failure(
        status: map['status'],
        code: map['code'],
        message: map['message'],
        statusCode: map['statusCode'] ?? 500,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'statusCode': statusCode,
      };
}
