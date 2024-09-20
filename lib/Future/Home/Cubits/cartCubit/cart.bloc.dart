import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart.state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(EmptyCartState());
  List<MainProduct> pcw = <MainProduct>[];
  void addToCart(MainProduct p) {
    for (var element in pcw) {
      if (p == element) {
        continue;
      }
    }
    pcw.add(p);
    emit(AddToCartState());
  }

  void removeformTheCart(MainProduct p) {
    pcw.remove(p);
    emit(AddToCartState());
  }
}
