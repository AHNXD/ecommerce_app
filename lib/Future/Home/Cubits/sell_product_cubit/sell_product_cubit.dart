import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Future/Home/models/sell_product_model.dart';
import 'package:meta/meta.dart';

import '../../../../Apis/ExceptionsHandle.dart';
import '../../../../Apis/Network.dart';
import '../../../../Apis/Urls.dart';

part 'sell_product_state.dart';

class SellProductCubit extends Cubit<SellProductState> {
  SellProductCubit() : super(SellProductInitial());

  void sendProduct(SellProductModel product) async {
    emit(SellProductLoading());
    try {
      final formData = await product.toFormData();
      Network.postDataWithFiles(url: Urls.sellProduct, data: formData)
          .then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          emit(SellProductSuccess(msg: value.data['msg']));
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(SellProductError(error: exceptionsHandle(error: error)));
      } else {
        emit(SellProductError(error: error.toString()));
      }
    }
  }
}
