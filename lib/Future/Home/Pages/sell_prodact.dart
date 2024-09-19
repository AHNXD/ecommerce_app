import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/sellProduct/sell_product_from.dart';

class SellProdact extends StatefulWidget {
  const SellProdact({super.key});

  @override
  State<SellProdact> createState() => _SellProdactState();
}

class _SellProdactState extends State<SellProdact> {
  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;
  late final PhoneController phoneController;
  late final TextEditingController priceController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  File? productImage;
  bool imageUploaded = false;
  @override
  void initState() {
    firstNameController = TextEditingController();

    lastNameController = TextEditingController();

    phoneController = PhoneController(
        initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ""));

    descriptionController = TextEditingController();

    priceController = TextEditingController();

    super.initState();
  }

  Future<void> submit() async {
    if (key1.currentState!.validate()) {
      if (imageUploaded) {
      } else {
        showErrorMessage('Please upload an image before submitting');
      }
    } else {
      showErrorMessage('Failed to add Product, please check the form');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUploaded = true;
      productImage = File(pickedFile.path);
    } else {
      showErrorMessage("Image isn't Upoalded,Pleas try agen");
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorMessage(
      String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(2.w)),
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
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Sell Your Product '),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
            child: Text(
              "Please Enter Your Information",
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
            ),
          ),
          SellProductForm(
              key1: key1,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Upload the product image',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Icon(
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
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(10)),
            height: 75,
            child: TextButton(
              onPressed: submit,
              child: const Text(
                'Save',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
