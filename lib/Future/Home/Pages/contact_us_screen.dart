import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Auth/Widgets/text_field_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/Contact_Us_Screen/logo_circle_avatar_widget.dart';
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
      backgroundColor: const Color(0xff42b583),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 114, 85),
        title: Text(
          "Contact Us",
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          LogoCircleAvatarWidget(
            radius: 30.w,
            top: 5.h,
            bottom: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  isPassword: false,
                  text: "User Name",
                ),
                TextFieldWidget(
                  controller: phoneNumberController,
                  isPassword: false,
                  text: "Phone Number",
                ),
                TextFieldWidget(
                  controller: messageController,
                  maxLine: 5,
                  isPassword: false,
                  text: "Description",
                ),
              ],
            ),
          ),
          MyButtonWidget(
            color: const Color.fromARGB(255, 28, 78, 57),
            verticalHieght: 2.h,
            text: "Submit",
            onPressed: () {},
            horizontalWidth: 8.w,
          )
        ],
      ),
    );
  }
}
