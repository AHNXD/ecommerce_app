import 'package:ecommerce_app_qr/Future/Home/Pages/product_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/models/catigories_model.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleCardWidget extends StatelessWidget {
  const TitleCardWidget(
      {super.key, required this.title, required this.id, required this.cData});
  final String title;
  final int id;
  final CatigoriesData cData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          TextButton(
              child: Text(
                "See All",
                style: TextStyle(
                    color: AppColors.seeAllTextButtonColor, fontSize: 12.sp),
              ),
              onPressed: () {
                if (id != 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) {
                    return ProductScreen(
                      isNotHome: false,
                      cData: cData,
                    );
                  }));
                }
              })
        ],
      ),
    );
  }
}
