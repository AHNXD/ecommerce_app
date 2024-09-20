import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:sizer/sizer.dart';

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
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        centerTitle: true,
        title: Text(
          "cart_screen_title".tr(context),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60,
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
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) => CartTile(
                deleteProudct: () {
                  setState(() {
                    l[index].userQuantity = 0;
                    context.read<CartCubit>().removeformTheCart(l[index]);
                  });
                },
                product: l[index],
                onRemove: () {
                  if (l[index].userQuantity != 1) {
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
              separatorBuilder: (context, index) => SizedBox(height: 3.h),
              itemCount: l.length,
            );
          }
        },
      ),
    );
  }
}
