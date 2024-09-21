import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/back_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/categories_button_widget.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopOvalWidget extends StatelessWidget {
  const TopOvalWidget(
      {super.key,
      required this.firstText,
      required this.parentId,
      required this.isNotHome});
  final String firstText;
  final int parentId;
  final bool isNotHome;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: CoustomClipPath(),
      child: Container(
        margin: EdgeInsets.zero,
        color: AppColors.offersContainerColor,
        height: 35.h,
        child: Column(
          children: [
            BackWidget(
              canPop: isNotHome,
              hasBackButton: true,
              hasStyle: false,
              iconColor: Colors.white,
              textColor: Colors.white,
              text: "products".tr(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "search_product_hint".tr(context),
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      textDirection: TextDirection.ltr,
                      Icons.search,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4.w))),
              ),
            ),
            SizedBox(
              height: 8.h,
              child: CategoriesButtonWidget(
                parentId: parentId,
                firstText: firstText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height + 4.h;
    final Path path = Path();
    double heightOffset = height * 0.25;
    path.lineTo(0, height - heightOffset);
    path.quadraticBezierTo(
      width * 0.5,
      height,
      width,
      height - heightOffset,
    );
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CoustomDownClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final Path path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(
      width * 0.5,
      height - 11.h,
      width,
      height,
    );
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
