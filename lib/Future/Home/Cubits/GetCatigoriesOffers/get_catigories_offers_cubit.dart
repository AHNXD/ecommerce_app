import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/ExceptionsHandle.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:ecommerce_app_qr/Future/Home/models/offers_catigories_model.dart';
import 'package:meta/meta.dart';

part 'get_catigories_offers_state.dart';

class GetCatigoriesOffersCubit extends Cubit<GetCatigoriesOffersState> {
  GetCatigoriesOffersCubit() : super(GetCatigoriesOffersInitial());
  OffersCatigoriesModel? offersCatigoriesModel;

  void getOffersCatigories() async {
    emit(GetCatigoriesOffersLoadingState());
    try {
      await Network.getData(url: Urls.getOffersCatigories).then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          offersCatigoriesModel = OffersCatigoriesModel.fromJson(response.data);

          emit(GetCatigoriesOffersSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          GetCatigoriesOffersErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        GetCatigoriesOffersErrorState(error.toString());
      }
    }
  }
}
