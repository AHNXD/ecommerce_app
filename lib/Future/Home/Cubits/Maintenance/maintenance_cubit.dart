import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/ExceptionsHandle.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:ecommerce_app_qr/Future/Home/models/maintenace_model.dart';
import 'package:ecommerce_app_qr/Utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'maintenance_state.dart';

class MaintenanceCubit extends Cubit<MaintenanceState> {
  MaintenanceCubit() : super(MaintenanceInitial());

  void sendMaintenanceOrder(MaintenaceModel order) async {
    emit(MaintenanceLoading());
    try {
      final formData = await order.toFormData();
      final response = await Network.postDataWithFiles(
          url: Urls.maintenance, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(MaintenanceSuccess(msg: response.data['msg']));
      } else {
        emit(MaintenanceError(
            error: lang == 'en'
                ? 'There was an error, please try again.'
                : 'حدث خطأ ما, الرجاء اعادة المحاولة.'));
      }
    } catch (error) {
      if (error is DioException) {
        emit(MaintenanceError(error: exceptionsHandle(error: error)));
      } else {
        print(error);
        emit(MaintenanceError(error: error.toString()));
      }
    }
  }
}
