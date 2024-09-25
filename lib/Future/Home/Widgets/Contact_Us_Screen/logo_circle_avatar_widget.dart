import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoCircleAvatarWidget extends StatelessWidget {
  const LogoCircleAvatarWidget({
    super.key,
    required this.top,
    required this.bottom,
  });
  final double top;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top, bottom: bottom, right: bottom, left: bottom),
      height: 180.sp,
      width: 180.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(
          AppImagesAssets.logoNoBg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
