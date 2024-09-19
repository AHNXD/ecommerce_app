import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/enums.dart';
import '../../../../Utils/validation.dart';
import '../../../Auth/Widgets/phone_field_widget.dart';
import '../../../Auth/Widgets/text_field_widget.dart';

class SellProductForm extends StatelessWidget {
  const SellProductForm({
    super.key,
    required this.key1,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.priceController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> key1;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final PhoneController phoneController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Form(
        key: key1,
        child: Column(
          children: [
            TextFieldWidget(
                validatorFun: (p0) => validation(p0, ValidationState.normal),
                text: "First Name",
                isPassword: false,
                controller: firstNameController),
            TextFieldWidget(
                validatorFun: (p0) => validation(p0, ValidationState.normal),
                text: "last Name",
                isPassword: false,
                controller: lastNameController),
            PhoneFieldWidget(controller: phoneController),
            TextFieldWidget(
                validatorFun: (p0) => validation(p0, ValidationState.normal),
                text: "Product  price",
                isPassword: false,
                controller: priceController),
            TextFieldWidget(
              validatorFun: (p0) => validation(p0, ValidationState.normal),
              text: "Product  Description",
              isPassword: false,
              controller: descriptionController,
              maxLine: 3,
            )
          ],
        ),
      ),
    );
  }
}
