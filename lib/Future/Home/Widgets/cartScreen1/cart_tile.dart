import 'package:ecommerce_app_qr/Future/Home/Pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../Apis/Urls.dart';
import '../../models/product_model.dart';
import '../cached_network_image.dart';
import 'proudact_daitles_cart.dart';
import 'qauntity_button.dart';

class CartTile extends StatelessWidget {
  final MainProduct product;
  final Function() onRemove;
  final Function() deleteProduct;
  final Function() onAdd;

  const CartTile({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onAdd,
    required this.deleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) {
          return DetailPage(product: product);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyCachedNetworkImage(
              height: 25.h,
              width: 45.w,
              imageUrl: product.files![0].path != null
                  ? Urls.storageProducts + product.files![0].name!
                  : product.files![0].name!,
            ),
            SizedBox(height: 2.h),
            PrudoctDaitlesCart(
              product: product,
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QauntityButton(
                  onRemove: onRemove,
                  product: product,
                  onAdd: onAdd,
                ),
                IconButton(
                  onPressed: deleteProduct,
                  icon: const Icon(
                    Ionicons.trash_outline,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
