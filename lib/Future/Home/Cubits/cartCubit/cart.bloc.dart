import 'package:dio/dio.dart';
import 'package:ecommerce_app_qr/Apis/Network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../../Apis/ExceptionsHandle.dart';
import '../../../../Apis/Urls.dart';

part 'cart.state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(EmptyCartState());
  List<MainProduct> pcw = <MainProduct>[];
  void addToCart(MainProduct p) {
    if (pcw.any((element) => element.id == p.id)) {
      emit(AlreadyInCartState());
    } else {
      pcw.add(p);
      emit(AddToCartState());
    }
  }

  Future<void> refreshCartOnLanguageChange() async {
    emit(CartLoadingState());
    try {
      List<int> productIds = pcw.map((product) => product.id!).toList();
      List<int> quantities =
          pcw.map((product) => product.userQuantity).toList();
      List<MainProduct> updatedProducts = await Future.wait(
        productIds.map((id) => getProductById(id)).toList(),
      );

      for (int i = 0; i < updatedProducts.length; i++) {
        updatedProducts[i].userQuantity = quantities[i];
      }
      pcw = updatedProducts;

      emit(CartRefreshState(loadedporduct: updatedProducts));
    } catch (error) {
      if (error is DioException) {
        emit(
          CartErrorState(
            errorMessage: exceptionsHandle(error: error),
          ),
        );
      } else {
        emit(CartErrorState(errorMessage: error.toString()));
      }
    }
  }

  Future<MainProduct> getProductById(int id) async {
    final response =
        await Network.getData(url: "${Urls.getProduct}/${id.toString()}");
    return MainProduct.fromJson(response.data['data']);
  }

  void increaseQuantity(MainProduct product) {
    product.userQuantity++;
    emit(AddToCartState());
  }

  void decreaseQuantity(MainProduct product) {
    product.userQuantity--;
    emit(AddToCartState());
  }

  void removeformTheCart(MainProduct p) {
    pcw.remove(p);
    emit(RemvoeFromCartState(porducts: pcw));
  }
}
