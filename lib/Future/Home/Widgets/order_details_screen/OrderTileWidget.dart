import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Apis/Urls.dart';
import '../cached_network_image.dart';

class OrderTileWidget extends StatelessWidget {
  final MainProduct product;
  final String? size;
  const OrderTileWidget({
    super.key,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (product.files != null)
            MyCachedNetworkImage(
              height: 10.h,
              width: 30.w,
              imageUrl: product.files![0].path != null
                  ? Urls.storageProducts + product.files![0].name!
                  : product.files![0].name!,
              // height: 10.h,
            ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.category!.name!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 10),
              if (size != "NULL" && size!.isNotEmpty)
                Text(
                  "size: $size",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                "${product.newSellingPrice != null ? product.newSellingPrice : product.sellingPrice} Sp",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: AppColors.primaryColors,
            child: Text(
              product.userQuantity.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
