part of 'cart.bloc.dart';

@immutable
sealed class CartState {}

final class AddToCartState extends CartState {}

final class RemvoeFromCartState extends CartState {}

final class AlreadyInCartState extends CartState {}

final class EmptyCartState extends CartState {}
