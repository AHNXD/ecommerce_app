import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/colors.dart';
import '/Future/Home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/cartCubit/cart.bloc.dart';
import '../Widgets/cartScreen1/cart_tile.dart';
import '../Widgets/cartScreen1/check_out_box.dart';
import '../Widgets/cartScreen1/constants.dart';

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
          leadingWidth: 60,
        ),
      ),
      bottomSheet: context.read<CartCubit>().pcw.isEmpty
          ? null
          : CheckOutBox(
              items: context.read<CartCubit>().pcw,
            ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List<MainProduct> l = context.read<CartCubit>().pcw;
          if (state is EmptyCartState || l.isEmpty) {
            return Center(
              child: Text("empty_cart".tr(context)),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: l.length,
                      itemBuilder: (context, index) => CartTile(
                        deleteProduct: () {
                          setState(() {
                            l[index].userQuantity = 0;
                            context
                                .read<CartCubit>()
                                .removeformTheCart(l[index]);
                          });
                        },
                        product: l[index],
                        onRemove: () {
                          if (l[index].userQuantity > 1) {
                            setState(() {
                              l[index].userQuantity--;
                            });
                          }
                        },
                        onAdd: () {
                          setState(() {
                            if (l[index].userQuantity < l[index].quantity!) {
                              l[index].userQuantity++;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
