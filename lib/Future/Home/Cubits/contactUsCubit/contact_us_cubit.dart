import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/ExceptionsHandle.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  void contactUsMessageSend(
      String name, String emailOrPhone, String message) async {
    emit(ContactUsLoadingState());
    try {
      await Network.postData(url: Urls.contactUs, data: {
        "name": name,
        "email_or_phone": emailOrPhone,
        "message": message,
      }).then((value) {
       

        if (value.statusCode == 200 || value.statusCode == 201) {
          emit(ContactUsSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          ContactUsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        ContactUsErrorState(error.toString());
      }
    }
  }

  void productComplaiment(int id, String text) async {
    emit(ContactUsLoadingState());
    try {
      await Network.postData(
          url: Urls.productComplaiment,
          data: {"product_id": id, "complaint_text": text}).then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          emit(ContactUsSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          ContactUsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        ContactUsErrorState(error.toString());
      }
    }
  }
//status = 0 employee 
//status = 1 public 
  void employeeComplaiment(
      String causeProblem, String employeeName, int status) async {
    emit(ContactUsLoadingState());
    try {
      await Network.postData(url: Urls.employeeComplaiment, data: {
        "cause_problem": causeProblem,
        "employee_name": employeeName,
        "status": status,
      }).then((value) {
      

        if (value.statusCode == 200 || value.statusCode == 201) {
          emit(ContactUsSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          ContactUsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        ContactUsErrorState(error.toString());
      }
    }
  }
}
