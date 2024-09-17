import 'package:ecommerce_app_qr/Future/Home/Widgets/Contact_Us_Screen/logo_circle_avatar_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const BackWidget(
          canPop: false,
          hasBackButton: false,
          text: "About Us",
          hasStyle: false,
          iconColor: Colors.black,
          textColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LogoCircleAvatarWidget(
              radius: 25.w,
              top: 2.h,
              bottom: 2.h,
            ),
            Center(
              child: Text(
                "E-commerce App",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.indigo, Colors.purple])),
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Center(
                child: Text(
                  'This is a description for any eccomerce app in flutter in the herckel Teach we develop the app android and ios and web (Back-end and fornt-end)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
              ),
            ),
            const Divider(),
            // const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: RichText(
                text: TextSpan(
                  text: "Phone Number\n",
                  children: [
                    TextSpan(
                      text: "+9639333333333",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Column(
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Development By\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: "Herckel Teach Comapany",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue))
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
