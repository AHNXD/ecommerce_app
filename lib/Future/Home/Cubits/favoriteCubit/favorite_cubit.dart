import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Future/Home/models/favorite_model.dart';
import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:ecommerce_app_qr/main.dart';
import 'package:flutter/material.dart';

import '../../../../Apis/ExceptionsHandle.dart';
import '../../../../Apis/Network.dart';
import '../../../../Apis/Urls.dart';
import '../../../../Utils/functions.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  FavoriteModel? fvModel;
  List<MainProduct> favoriteProduct = <MainProduct>[];
  void getProductsFavorite(bool isApi) async {
    emit(GetFavoriteProductsLoadingState());
    try {
      await Network.getData(url: Urls.getProductsFavorite).then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          fvModel = FavoriteModel.fromJson(response.data);
          if (!isApi) {
            getFavorite(scaffoldKey.currentState!.context);
          }
          emit(GetFavoriteProductsSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          FavoriteProductsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        FavoriteProductsErrorState(error.toString());
      }
    }
  }

  void addAndDelFavoriteProducts(int id) async {
    try {
      await Network.postData(
          url: Urls.addAndDelProductsFavorite, data: {"id": id}).then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          showSuccessSnackBar(message: value.data['msg']!);
          emit(FavoriteProductSuccessfulState());
        }
      });
    } catch (error) {
      if (error is DioException) {
        emit(
          FavoriteProductsErrorState(
            exceptionsHandle(error: error),
          ),
        );
      } else {
        FavoriteProductsErrorState(error.toString());
      }
    }
  }
}
