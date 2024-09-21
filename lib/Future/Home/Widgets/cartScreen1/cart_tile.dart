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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.all(2.h),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              // Product Image
              MyCachedNetworkImage(
                height: 10.h,
                width: 30.w,
                imageUrl: '', // Placeholder for the product image
                // Placeholder for the product image
                // imageUrl: product.files![0].path != null
                //     ? Urls.storageProducts + product.files![0].name!
                //     : product.files![0].name!,
                // height: 10.h,
              ),
              SizedBox(height: 1.h),
              QauntityButton(
                  onRemove: onRemove, product: product, onAdd: onAdd),
            ],
          ),
          SizedBox(width: 3.w),
          PrudoctDaitlesCart(product: product),
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
    );
  }
}
