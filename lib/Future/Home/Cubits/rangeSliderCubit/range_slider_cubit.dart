import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/ExceptionsHandle.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:ecommerce_app_qr/Future/Home/models/min_max_rangeslider.dart';
import 'package:meta/meta.dart';

import '../getCatigories/get_catigories_cubit.dart';

part 'range_slider_state.dart';

class RangeSliderCubit extends Cubit<RangeSliderState> {
  RangeSliderCubit() : super(RangeSliderInitial());
  MinAndMaxRangeSliderModel? mamrsModel;
  void getMinAndMax(int catId) async {
    emit(RangeSliderLoadingState());
    try {
      await Network.getData(
        url: "${Urls.minMax}?category=$catId",
      ).then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          mamrsModel = MinAndMaxRangeSliderModel.fromJson(value.data);
          emit(RangeSliderSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          RangeSliderErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        GetCatigoriesErrorState(error.toString());
      }
    }
  }
}
