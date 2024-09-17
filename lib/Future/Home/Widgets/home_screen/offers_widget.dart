import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:ecommerce_app_qr/Future/Home/models/offers_catigories_model.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../cached_network_image.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key, required this.data});
  final OffersCatigoriesData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          color: AppColors.offersContainerColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCachedNetworkImage(
            width: 30.w, height: 15.h,
            imageUrl: data.category!.files!.first.path == null
                ? data.category!.files!.first.name!
                : Urls.storageCategories + data.category!.files!.first.name!,
            // height: 10.h,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What do you wating for",
                style: TextStyle(color: Colors.white38, fontSize: 7.sp),
              ),
              Text(
                "30% off on your\n First Purchase",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
