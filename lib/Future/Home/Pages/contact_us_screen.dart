import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Auth/Widgets/text_field_widget.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({
    super.key,
  });
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: AppColors.primaryColors,
        title: Text(
          "contact_us".tr(context),
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(
              AppImagesAssets.logoNoBg,
              width: 140.sp,
              height: 140.sp,
              // fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  isPassword: false,
                  text: "user_name".tr(context),
                ),
                TextFieldWidget(
                  controller: phoneNumberController,
                  isPassword: false,
                  text: "phone_number".tr(context),
                ),
                TextFieldWidget(
                  controller: messageController,
                  maxLine: 5,
                  isPassword: false,
                  text: "description".tr(context),
                ),
              ],
            ),
          ),
          MyButtonWidget(
            color: AppColors.buttonCategoryColor,
            verticalHieght: 2.h,
            text: "submit".tr(context),
            onPressed: () {},
            horizontalWidth: 8.w,
          )
        ],
      ),
    );
  }
}
