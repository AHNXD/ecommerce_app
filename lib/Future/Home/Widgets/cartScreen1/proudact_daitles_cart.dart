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
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 2.h),
          Text(
            "${product.newSellingPrice != null ? product.newSellingPrice! * product.userQuantity : product.sellingPrice! * product.userQuantity} Sp",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
