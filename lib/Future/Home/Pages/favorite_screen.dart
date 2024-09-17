import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/functions.dart';
import '../../../Utils/test_lists.dart';
import '../Cubits/favoriteCubit/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const BackWidget(
          canPop: true,
          hasBackButton: false,
          hasStyle: true,
          text: "Favorite Screen",
          iconColor: Colors.white,
          textColor: Colors.black,
        ),
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          print(state);
          if (state is GetFavoriteProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteProductsErrorState) {
            return MyErrorWidget(
                msg: state.message,
                onPressed: () {
                  context.read<FavoriteCubit>().getProductsFavorite(false);
                });
          } else {
            if (getFavoriteProduct(context).isEmpty) {
              return const Center(
                child: Text(
                  "You Don't Have Any Product in The Favorite",
                ),
              );
            }
            return GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount:
                  productCardList(false, getFavoriteProduct(context)).length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.059.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 2.h),
              itemBuilder: (context, index) {
                return productCardList(
                    false, getFavoriteProduct(context))[index];
              },
            );
          }
        },
      ),
    );
  }
}
