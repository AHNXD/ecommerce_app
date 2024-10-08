import 'package:ecommerce_app_qr/Future/Home/Cubits/AbouUs/about_us_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/Contact_Us_Screen/logo_circle_avatar_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/models/aboutUs_model.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/colors.dart';
import '../Cubits/cubit/about_us_cubit.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AboutUsCubit>().getAboutUsInfo();
    return Scaffold(
      //     appBar: PreferredSize(
      // preferredSize: AppBar().preferredSize,
      // child: BackWidget(
      //   canPop: false,
      //   hasBackButton: false,
      //   text: "about_us".tr(context),
      //   hasStyle: false,
      //   iconColor: Colors.black,
      //   textColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primaryColors,
        centerTitle: true,
        title: Text(
          "about_us".tr(context),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(child: BlocBuilder<AboutUsCubit, AboutUsState>(
        builder: (context, state) {
          if (state is GetAboutUsSuccessfulState) {
            return AboutUsWidget(
              aboutUs: state.aboutUs,
            );
          } else if (state is GetAboutUsErrorState) {
            return MyErrorWidget(
                msg: state.msg,
                onPressed: () {
                  context.read<AboutUsCubit>().getAboutUsInfo();
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

class AboutUsWidget extends StatelessWidget {
  final AboutUsModel aboutUs;
  const AboutUsWidget({super.key, required this.aboutUs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoCircleAvatarWidget(
          top: 2.h,
          bottom: 2.h,
        ),
        Center(
          child: Text(
            aboutUs.shopName ?? "",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(),
        //const Divider(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.indigo, Colors.purple])),
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Center(
            child: Text(
              aboutUs.descrption ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ),
        ),
        //const Divider(),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
            text: TextSpan(
              text: "phone_number".tr(context),
              children: [
                TextSpan(
                  text: "\n${aboutUs.phoneNumber ?? ""}",
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
                    text: "development_by".tr(context),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "\n${aboutUs.companyName ?? ""}",
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
    );
  }
}
