import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoCircleAvatarWidget extends StatelessWidget {
  const LogoCircleAvatarWidget({
    super.key,
    required this.top,
    required this.bottom, required this.radius,
  });
  final double top;
  final double bottom;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      decoration:
          ShapeDecoration(shape: CircleBorder(side: BorderSide(width: 1.w))),
      child: CircleAvatar(
        foregroundColor: Colors.black,
        radius: radius,
        backgroundImage: const AssetImage(AppImagesAssets.logo),
      ),
    );
  }
}
