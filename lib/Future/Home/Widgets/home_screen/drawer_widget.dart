import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/about_us_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/compair_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/contact_us_screen.dart';
import 'package:ecommerce_app_qr/Utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60.sp,
                backgroundImage: const AssetImage(
                  AppImagesAssets.logo,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              MyButtonWidget(
                  text: "Contact Us",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "About Us",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              // MyButtonWidget(
              //     text: "Comapair Pruducts",
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const CompairScreen(),
              //           ));
              //     },
              //     verticalHieght: 1.h,
              //     horizontalWidth: 2.w,
              //     color: AppColors.buttonCategoryColor),
              const Spacer(),
              !AppSharedPreferences.hasToken
                  ? Column(
                      children: [
                        MyButtonWidget(
                            text: "LogIn",
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                        MyButtonWidget(
                            text: "SignUp",
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                      ],
                    )
                  : MyButtonWidget(
                      text: "Log Out",
                      onPressed: () {},
                      verticalHieght: 1.h,
                      horizontalWidth: 2.w,
                      color: AppColors.textTitleAppBarColor),
              MyButtonWidget(
                  text: "Language",
                  onPressed: () {},
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.textTitleAppBarColor)
            ],
          ),
        ),
      ),
    );
  }
}
