import 'dart:io';

import 'package:dio/dio.dart';

class SellProductModel {
  String? name;
  String? productName;
  String? phone;
  String? productDescription;
  double? price;
  File? image;
  SellProductModel(this.name, this.phone, this.productName, this.price,
      this.productDescription, this.image);

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "name": name,
      "phone_number": phone,
      "product_name": productName,
      "description": productDescription,
      "price": price,
      "image": image != null ? await MultipartFile.fromFile(image!.path) : null,
    });
  }
}
