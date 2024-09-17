import 'package:ecommerce_app_qr/Future/Auth/Pages/forget_password.dart';
import 'package:ecommerce_app_qr/Future/Auth/Pages/signup_screen.dart';
import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Auth/Widgets/text_field_widget.dart';
import 'package:ecommerce_app_qr/Future/Auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/navbar_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/back_widget.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/enums.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:ecommerce_app_qr/Utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailOrPhoneNumberController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 7.h),
        child: const BackWidget(canPop: true,
          hasBackButton: false,
          hasStyle: false,
          iconColor: Colors.black,
          textColor: Colors.black,
          text: "Login",
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessfulState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(2.w)),
                    margin: EdgeInsets.symmetric(horizontal: 0.1.w),
                    child: const Text(
                      "تم تسجيل الدخول بنجاح",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  duration: const Duration(seconds: 2)),
            );
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (builder) {
              return const NavBarPage();
            }));
          }
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                  duration: const Duration(seconds: 2)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  AppImagesAssets.test1,
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Text(
                    "Login to your Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextFieldWidget(
                  validatorFun: (p0) => validation(p0, ValidationState.normal),
                  text: "Enter your Email or Phone Number",
                  controller: emailOrPhoneNumberController,
                  isPassword: false,
                ),
                TextFieldWidget(
                  validatorFun: (p0) =>
                      validation(p0, ValidationState.password),
                  controller: passwordController,
                  text: "Password",
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (builder) {
                          return const SignupScreen();
                        }));
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 0.6,
                            decorationColor: AppColors.buttonCategoryColor,
                            color: AppColors.buttonCategoryColor,
                            fontSize: 12.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return ForgetPassword();
                        }));
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            decorationThickness: 0.6,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.buttonCategoryColor,
                            color: AppColors.buttonCategoryColor,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
                state is AuthLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : MyButtonWidget(
                        color: AppColors.buttonCategoryColor,
                        verticalHieght: 0,
                        horizontalWidth: 0,
                        text: "Sign In",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                email: emailOrPhoneNumberController.text.trim(),
                                password: passwordController.text.trim());
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
