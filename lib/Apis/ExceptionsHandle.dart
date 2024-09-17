// ignore_for_file: file_names, unnecessary_brace_in_string_interps, avoid_print

import 'package:dio/dio.dart';

String exceptionsHandle({required DioException error}) {
  String? message;

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      message = "السيرفر لا يستجيب ";

      return message;

    case DioExceptionType.sendTimeout:
      message = 'انتهى وقت الانتظار , يرجى إعادة المحاولة لاحقا';

      return message;
    case DioExceptionType.receiveTimeout:
      message = "السيرفر لا يستجيب ";

      return message;
    case DioExceptionType.badResponse:
      // message = error.response!.data['msg'];
      print("error type is ${message}");
      message = "Error in the server";

      return message;
    case DioExceptionType.cancel:
      message = "الغاء الطلب";

      return message;
    case DioExceptionType.unknown:
      error.message!.contains('SocketException')
          ? message = "تحقق من وجود الانترنت"
          : message = error.message!;

      return message;
    case DioExceptionType.badCertificate:
      message = 'حدث خطأ ما';
      return message;
    case DioExceptionType.connectionError:
      message = 'تحقق من الاتصال بالانترنت';
      return message;
    default:
      return message!;
  }

  // return message!;
}
