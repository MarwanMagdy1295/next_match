import 'dart:io';
import 'package:dio/dio.dart';

class ErrorModel {
  ErrorModel({
    required this.message,
  });

  final String? message;

  static ErrorModel parse(
    Object e, {
    MultiMessageResponseErrorModel Function(Map<String, dynamic> errors)?
        multiMessageResponseModel,
  }) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return TimeoutErrorModel();
        case DioExceptionType.receiveTimeout:
          return TimeoutErrorModel();
        case DioExceptionType.sendTimeout:
          return TimeoutErrorModel();
        case DioExceptionType.badResponse:
          return ResponseErrorModel.parse(
            response: e.response!,
            multiMessageResponseModel: multiMessageResponseModel,
          );
        case DioExceptionType.unknown:
          if (e.error is SocketException) {
            return SocketErrorModel();
          }
          break;
        default:
      }
    }

    return UnexpectedErrorModel();
  }
}

class TimeoutErrorModel extends ErrorModel {
  TimeoutErrorModel() : super(message: 'TimeOut Error');
}

class SocketErrorModel extends ErrorModel {
  SocketErrorModel() : super(message: 'Socket Exption');
}

class UnexpectedErrorModel extends ErrorModel {
  UnexpectedErrorModel() : super(message: 'Unexpected Error');
}

abstract class ResponseErrorModel extends ErrorModel {
  ResponseErrorModel({
    required String message,
  }) : super(message: message);

  static ResponseErrorModel parse({
    required Response response,
    MultiMessageResponseErrorModel Function(Map<String, dynamic> errors)?
        multiMessageResponseModel,
  }) {
    final status = response.statusCode;

    switch (status) {
      case HttpStatus.unauthorized:
        return UnauthorizedResponseErrorModel();
      case HttpStatus.notFound:
        return NotFoundResponseErrorModel();
      case HttpStatus.badRequest:
        try {
          final errorContent = response.data['errors'];

          return multiMessageResponseModel?.call(errorContent) ??
              MultiMessageResponseErrorModel(
                errors: errorContent,
              );
        } catch (e) {
          return UnexpectedResponseErrorModel();
        }
    }

    return InternalServerResponseErrorModel();
  }
}

class UnauthorizedResponseErrorModel extends ResponseErrorModel {
  UnauthorizedResponseErrorModel()
      : super(message: 'Error Action Unauthorized');
}

class NotFoundResponseErrorModel extends ResponseErrorModel {
  NotFoundResponseErrorModel() : super(message: 'Error Action NotFound');
}

class UnexpectedResponseErrorModel extends ResponseErrorModel {
  UnexpectedResponseErrorModel()
      : super(message: 'Error Action Unexpected Response');
}

class InternalServerResponseErrorModel extends ResponseErrorModel {
  InternalServerResponseErrorModel()
      : super(message: 'Error Action Internal Server');
}

class SingleMessageResponseErrorModel extends ResponseErrorModel {
  SingleMessageResponseErrorModel({
    required super.message,
  });
}

class MultiMessageResponseErrorModel<T> extends ResponseErrorModel {
  MultiMessageResponseErrorModel({
    required this.errors,
  }) : super(message: 'Error Action Form');

  final Map<String, dynamic> errors;
}
