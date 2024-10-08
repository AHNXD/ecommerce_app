import 'dart:io';

import 'package:dio/dio.dart';

class SellProductModel {
  String? name;
  String? productName;
  String? phone;
  String? productDescription;
  double? price;
  List<File>? images;
  SellProductModel(
    this.name,
    this.phone,
    this.productName,
    this.price,
    this.productDescription,
    this.images,
  );

  Future<FormData> toFormData() async {
    List<MultipartFile> imageFiles = [];
    if (images != null && images!.isNotEmpty) {
      for (var image in images!) {
        String fileName = image.path.split('/').last;
        imageFiles
            .add(await MultipartFile.fromFile(image.path, filename: fileName));
      }
    }

    return FormData.fromMap({
      "name": name,
      "phone_number": phone,
      "product_name": productName,
      "description": productDescription,
      "price": price,
      "image": imageFiles,
    });
  }
}
