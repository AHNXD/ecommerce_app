import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/colors.dart';
import '/Future/Home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/cartCubit/cart.bloc.dart';
import '../Widgets/cartScreen1/cart_tile.dart';
import '../Widgets/cartScreen1/check_out_box.dart';

class CartScreen1 extends StatefulWidget {
  const CartScreen1({super.key});

  @override
  State<CartScreen1> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 10.h),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "cart_screen_title".tr(context),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.primaryColors),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List<MainProduct> l = context.read<CartCubit>().pcw;
          if (state is EmptyCartState || l.isEmpty) {
            return Center(
              child: Text("empty_cart".tr(context)),
            );
          } else if (state is CartRefreshState) {
            return CartListViewItem(l: state.loadedporduct);
          } else if (state is RemvoeFromCartState) {
            return CartListViewItem(l: state.porducts);
          } else if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartErrorState) {
            return MyErrorWidget(
                msg: state.errorMessage,
                onPressed:
                    context.read<CartCubit>().refreshCartOnLanguageChange);
          } else {
            return CartListViewItem(l: l);
          }
        },
      ),
    );
  }
}

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({
    super.key,
    required this.l,
  });

  final List<MainProduct> l;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CheckOutBox(
              items: context.read<CartCubit>().pcw,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: l.length,
              itemBuilder: (context, index) => CartTile(
                deleteProduct: () {
                  context.read<CartCubit>().pcw[index].userQuantity = 0;
                  context.read<CartCubit>().removeformTheCart(l[index]);
                },
                product: l[index],
                onRemove: () {
                  if (l[index].userQuantity > 1) {
                    context.read<CartCubit>().decreaseQuantity(l[index]);
                  }
                },
                onAdd: () {
                  if (l[index].userQuantity < l[index].quantity!) {
                    context.read<CartCubit>().increaseQuantity(l[index]);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
