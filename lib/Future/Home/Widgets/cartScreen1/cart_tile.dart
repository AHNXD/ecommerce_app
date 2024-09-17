import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../../../Apis/Urls.dart';
import '../cached_network_image.dart';
import 'constants.dart';

class CartTile extends StatelessWidget {
  final MainProduct product;
  final Function() onRemove;
  final Function() deleteProudct;
  final Function() onAdd;
  const CartTile(
      {super.key,
      required this.product,
      required this.onRemove,
      required this.onAdd,
      required this.deleteProudct});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
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
                  Text(
                    "${product.newSellingPrice != null ? product.newSellingPrice : product.sellingPrice} Sp",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: deleteProudct,
                icon: const Icon(
                  Ionicons.trash_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: kcontentColor,
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      iconSize: 18,
                      icon: const Icon(
                        Ionicons.remove_outline,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      product.userQuantity.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: onAdd,
                      iconSize: 18,
                      icon: const Icon(
                        Ionicons.add_outline,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
