import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/ExceptionsHandle.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app_qr/Future/Home/models/aboutUs_model.dart';
import 'package:meta/meta.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());

  void getAboutUsInfo() async {
    emit(GetAboutUsLoadingState());
    try {
      await Network.getData(url: Urls.getabout).then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          AboutUsModel aboutUs = AboutUsModel.fromJson(response.data["data"]);

          emit(GetAboutUsSuccessfulState(aboutUs: aboutUs));
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          GetAboutUsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        GetAboutUsErrorState(error.toString());
      }
    }
  }
}
