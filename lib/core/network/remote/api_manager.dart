import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../common/api_result.dart';


@singleton
class ApiManager {
  Future<Result<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return SuccessResult<T>(response);
    } on SocketException {
      return FailureResult<T>("no internet connection");
    } on DioException catch (e) {
      return _handleDioException<T>(e);
    } on FormatException {
      return FailureResult<T>(
        "There was an issue processing the data. Please try again or contact support if the issue persists.",
      );
    } catch (e) {
      return FailureResult<T>(
        "Yikes, something unexpected happened. Please try again or let us know if it keeps occurring!",
      );
    }
  }

  Result<T> _handleDioException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return FailureResult<T>(_getTimeoutMessage(e.type));
      case DioExceptionType.badCertificate:
        return FailureResult<T>(
          "There's a security issue with our certificate. Please reach out to support for help.",
        );
      case DioExceptionType.badResponse:
        if (e.response == null) {
          return FailureResult<T>(
            "Something went wrong on our end. We're sorry about that—please try again later.",
          );
        }
        return _handleBadResponse<T>(e.response!);
      case DioExceptionType.cancel:
        return FailureResult<T>(
          "It looks like the request was cancelled. Let us know if you need assistance!",
        );
      case DioExceptionType.connectionError:
        return FailureResult<T>(
          "Connection failed. Could you check your network and try again?",
        );
      case DioExceptionType.unknown:
        return FailureResult<T>(
          "Yikes, something unexpected happened. Please try again or let us know if it keeps occurring!",
        );
    }
  }

  Result<T> _handleBadResponse<T>(Response response) {
    final statusCode = response.statusCode ?? 500;
    final errorMessage = _extractErrorMessage(response.data);

    switch (statusCode) {
      case 400:
        return FailureResult<T>(
          errorMessage
        );
      case 401:
        return FailureResult<T>(
          errorMessage
        );
      case 403:
        return FailureResult<T>(
          errorMessage
        );
      case 404:
        return FailureResult<T>(
          errorMessage
        );
      case 500:
        return FailureResult<T>(
          errorMessage
        );
      default:
        return FailureResult<T>(
          'Unexpected error: $errorMessage'
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['error']?.toString() ??
          "Something went wrong on our end. We're sorry about that—please try again later.";
    }
    return data.toString();
  }

  String _getTimeoutMessage(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return "The connection timed out. Please check your internet";
      case DioExceptionType.sendTimeout:
        return "Sending took too long this time. Could you try again when you're ready?";
      case DioExceptionType.receiveTimeout:
        return "It's taking longer than usual to get a response. Please give it another try.";
      default:
        return "oops, we lost connection for a moment. Try again when you're ready!";
    }
  }
}
