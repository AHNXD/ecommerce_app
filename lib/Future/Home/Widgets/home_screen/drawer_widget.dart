import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/about_us_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/sell_prodact.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/locale/locale_cubit.dart';
import 'package:ecommerce_app_qr/Utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:ecommerce_app_qr/Utils/services/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Pages/contact_us_screen.dart';

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
                  text: "contact_us".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "about_us".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "sell_product".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SellProdact()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              const Spacer(),
              !AppSharedPreferences.hasToken
                  ? Column(
                      children: [
                        MyButtonWidget(
                            text: "logIn".tr(context),
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                        MyButtonWidget(
                            text: "signUp".tr(context),
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                      ],
                    )
                  : MyButtonWidget(
                      text: "logOut".tr(context),
                      onPressed: () {},
                      verticalHieght: 1.h,
                      horizontalWidth: 2.w,
                      color: AppColors.textTitleAppBarColor),
              MyButtonWidget(
                  text: "language".tr(context),
                  onPressed: () async {
                    String langCode =
                        await SaveService.retrieve("LOCALE") ?? "en";
                    context
                        .read<LocaleCubit>()
                        .changeLanguage(langCode == "en" ? "ar" : "en");
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.textTitleAppBarColor),
            ],
          ),
        ),
      ),
    );
  }
}
