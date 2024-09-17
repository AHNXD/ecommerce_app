part of 'search_products_cubit.dart';

@immutable
sealed class SearchProductsState {}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoadingState extends SearchProductsState {}

final class SearchProductsSuccessfulState extends SearchProductsState {
  SearchProductsSuccessfulState();
}

final class SearchProductsErrorState extends SearchProductsState {
  final String message;
  SearchProductsErrorState(this.message);
}
