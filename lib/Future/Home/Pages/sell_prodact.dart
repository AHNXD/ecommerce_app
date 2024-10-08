import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/sell_product_cubit/sell_product_cubit.dart';

import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/constants.dart';
import '../Widgets/sellProduct/sell_product_from.dart';
import '../models/sell_product_model.dart';

class SellProdact extends StatefulWidget {
  const SellProdact({super.key});

  @override
  State<SellProdact> createState() => _SellProdactState();
}

class _SellProdactState extends State<SellProdact> {
  late final TextEditingController nameController;

  late final TextEditingController productNameController;
  late final PhoneController phoneController;
  late final TextEditingController priceController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  File? productImage;
  bool imageUploaded = false;
  @override
  void initState() {
    nameController = TextEditingController();

    productNameController = TextEditingController();

    phoneController = PhoneController(
        initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ""));

    descriptionController = TextEditingController();

    priceController = TextEditingController();

    super.initState();
  }

  Future<void> submit() async {
    if (key1.currentState!.validate()) {
      if (imageUploaded) {
        final double? price = double.tryParse(priceController.text);
        if (price == null) {
          showrMessage(
              Colors.red[400]!,
              lang == 'en'
                  ? "Please enter a valid number"
                  : "الرجاء ادخال رقم صحيح");
          return;
        }
        showAwesomeDialogForConfirm(
            sellProduct: SellProductModel(
                nameController.text,
                "00${phoneController.value.countryCode}${phoneController.value.nsn}",
                productNameController.text,
                price,
                descriptionController.text,
                productImage));
      } else {
        showrMessage(Colors.red[400]!,
            'please_upload_an_image_before_submitting'.tr(context));
      }
    } else {
      showrMessage(Colors.red[400]!, 'failed_to_add_product'.tr(context));
    }
  }

  void showAwesomeDialogForConfirm({
    required SellProductModel sellProduct,
  }) async {
    await AwesomeDialog(
            descTextStyle: TextStyle(fontSize: 15.sp),
            btnOkText: "yes".tr(context),
            btnCancelText: "no".tr(context),
            context: context,
            dialogType: DialogType.infoReverse,
            animType: AnimType.scale,
            title: "confirm_product".tr(context),
            btnOkOnPress: () {
              context.read<SellProductCubit>().sendProduct(sellProduct);
            },
            btnCancelOnPress: () {})
        .show();
  }

  void showAwesomeDialogSuccess({required String message}) async {
    await AwesomeDialog(
      descTextStyle: TextStyle(fontSize: 15.sp),
      btnOkText: "ok".tr(context),
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: message,
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUploaded = true;
      productImage = File(pickedFile.path);
      showrMessage(Colors.green[400]!, "image_uploded".tr(context));
    } else {
      showrMessage(Colors.red[400]!, "image_isn't_upoalded".tr(context));
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showrMessage(
      Color color, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(2.w)),
            margin: EdgeInsets.symmetric(horizontal: 0.1.w),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
          duration: const Duration(seconds: 5)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    productNameController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellProductCubit, SellProductState>(
      listener: (context, state) {
        if (state is SellProductSuccess) {
          showAwesomeDialogSuccess(message: state.msg);
        } else if (state is SellProductError) {
          showrMessage(Colors.red[400]!, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primaryColors,
          centerTitle: true,
          title: Text(
            'sell_product_screen_title'.tr(context),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
              child: Text(
                "sell_product_hint".tr(context),
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
            SellProductForm(
                key1: key1,
                nameController: nameController,
                productNameController: productNameController,
                phoneController: phoneController,
                priceController: priceController,
                descriptionController: descriptionController),
            GestureDetector(
              onTap: pickImage,
              child: Container(
                margin: const EdgeInsets.all(25),
                height: 75,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 240, 255),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'upload_photo_info'.tr(context),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const Icon(
                      Icons.file_upload_outlined,
                      size: 27,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.primaryColors,
                  borderRadius: BorderRadius.circular(10)),
              height: 75,
              child: TextButton(
                onPressed: submit,
                child: Text(
                  'send_info'.tr(context),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
