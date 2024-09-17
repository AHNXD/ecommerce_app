import 'package:ecommerce_app_qr/Future/Home/Pages/cart_information.dart';
import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckOutBox extends StatelessWidget {
  final List<MainProduct> items;
  const CheckOutBox({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${items.length > 1 ? items.map((e) => (e.userQuantity * (e.newSellingPrice == null ? e.sellingPrice : e.newSellingPrice)!)).reduce((value1, value2) => value1 + value2) : items[0].userQuantity * (items[0].newSellingPrice == null ? items[0].sellingPrice : items[0].newSellingPrice)!}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (b) {
                return const CartInformation();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonCategoryColor,
              minimumSize: const Size(double.infinity, 55),
            ),
            child: const Text(
              "Check out",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
