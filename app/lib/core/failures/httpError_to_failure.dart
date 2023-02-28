import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/core/services/http/http.dart';

httpErrorToFailure(HttpError error) {
  switch (error) {
    case HttpError.badRequest:
      return NetworkFailure();
    case HttpError.notFound:
      return InputFailure('Not Found', code: 404);
    default:
      return NetworkFailure();
  }
}
