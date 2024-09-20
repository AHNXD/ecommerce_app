import 'package:bloc/bloc.dart';

import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:meta/meta.dart';

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

  void removeformTheCart(MainProduct p) {
    pcw.remove(p);
    emit(RemvoeFromCartState());
  }
}
