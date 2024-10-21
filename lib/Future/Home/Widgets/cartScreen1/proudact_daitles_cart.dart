import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/product_model.dart';

class PrudoctDaitlesCart extends StatelessWidget {
  const PrudoctDaitlesCart({
    super.key,
    required this.product,
  });

  final MainProduct product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.name!,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          product.category!.name!,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
          ),
        ),
        if (product.selectedSize != null &&
            product.selectedSize != "NULL" &&
            product.selectedSize!.isNotEmpty)
          Text(
            "size: ${product.selectedSize}",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
          ),
        SizedBox(height: 2.h),
        Text(
          "${product.newSellingPrice != null ? double.tryParse(product.newSellingPrice!)! * product.userQuantity : product.sellingPrice! * product.userQuantity} Sp",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
