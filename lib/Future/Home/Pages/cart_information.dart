 import 'package:restart_app/restart_app.dart';

import '/Future/Auth/Widgets/my_button_widget.dart';
import '/Future/Auth/Widgets/phone_field_widget.dart';
import '/Future/Auth/Widgets/text_field_widget.dart';
import '/Utils/colors.dart';
import '/Utils/enums.dart';
import '/Utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/app_lottie_assets_manager.dart';
import '../../../Utils/functions.dart';
import '../Cubits/postOrders/post_orders_cubit.dart';
import '../models/order_information.dart';

class CartInformation extends StatefulWidget {
  const CartInformation({super.key});

  @override
  State<CartInformation> createState() => _CartInformationState();
}

class _CartInformationState extends State<CartInformation> {
  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;

  late final TextEditingController emailController;

  late final PhoneController phoneController;

  late final TextEditingController address1Controller;

  late final TextEditingController address2Controller;

  late final TextEditingController countryController;

  late final TextEditingController cityController;

  late final TextEditingController noteController;

  late final TextEditingController codeController;

  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  @override
  void initState() {
    firstNameController = TextEditingController();

    lastNameController = TextEditingController();

    emailController = TextEditingController();

    phoneController = PhoneController(
        initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ""));

    address1Controller = TextEditingController();

    address2Controller = TextEditingController();

    countryController = TextEditingController();

    cityController = TextEditingController();

    noteController = TextEditingController();

    codeController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();

    lastNameController.dispose();

    emailController.dispose();

    phoneController.dispose();

    address1Controller.dispose();

    address2Controller.dispose();

    countryController.dispose();

    cityController.dispose();

    noteController.dispose();

    // codeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostOrdersCubit, PostOrdersState>(
        listener: (context, state) {
          if (state is PostOrdersSuccessfulState) {
            showSuccessSnackBar(message: "The Order Was Send Successfully");
            Future.delayed(const Duration(seconds: 4)).then((onValue) {
              // context.read<CartCubit>().pcw = [];
              // context
              //     .read<PagesScreenCubit>()
              //     .changedScreen(AppScreen.home, context);
              // getAllApiInMainPage(context);
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (builder) {
              //     return const NavBarPage();
              //   }),
              //   (route) => false,
              
              // );
              Restart.restartApp();
            });
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: Colors.black,
            progressIndicator: Lottie.asset(
                AppLottieAssetsManager.telegramLoadingAnimation,
                animate: true,
                repeat: true),
            inAsyncCall: state is PostOrdersLoadingState,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
                  child: Text(
                    "Please Enter Your Information to Check Order",
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Form(
                    key: key1,
                    child: Column(
                      children: [
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.normal),
                            text: "First Name",
                            isPassword: false,
                            controller: firstNameController),
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.normal),
                            text: "last Name",
                            isPassword: false,
                            controller: lastNameController),
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.email),
                            text: "Email",
                            isPassword: false,
                            controller: emailController),
                        PhoneFieldWidget(controller: phoneController),
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.normal),
                            text: "Address 1",
                            isPassword: false,
                            controller: address1Controller),
                        TextFieldWidget(
                            text: "Address 2",
                            isPassword: false,
                            controller: address2Controller),
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.normal),
                            text: "Country",
                            isPassword: false,
                            controller: countryController),
                        TextFieldWidget(
                            validatorFun: (p0) =>
                                validation(p0, ValidationState.normal),
                            text: "City",
                            isPassword: false,
                            controller: cityController),
                        TextFieldWidget(
                            text: "Note",
                            isPassword: false,
                            controller: noteController),
                        MyButtonWidget(
                            text: "Send Order",
                            onPressed: () async {
                              if (key1.currentState!.validate()) {
                                showAwesomeDialogForAskCode(
                                    context: context,
                                    order: OrderInformation(
                                        code: codeController.text.trim(),
                                        address1:
                                            address1Controller.text.trim(),
                                        address2:
                                            address2Controller.text.trim(),
                                        city: cityController.text,
                                        country: countryController.text,
                                        email: emailController.text.trim(),
                                        firstName:
                                            firstNameController.text.trim(),
                                        lastName:
                                            lastNameController.text.trim(),
                                        note: noteController.text,
                                        phone:
                                            "00${phoneController.value.countryCode}${phoneController.value.nsn}",
                                        productId: getListOfProductsId(context),
                                        quantity:
                                            getListOfProductsQuantity(context)),
                                    codeController: codeController);
                              }
                            },
                            verticalHieght: 2.h,
                            horizontalWidth: 2.w,
                            color: AppColors.buttonCategoryColor)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
