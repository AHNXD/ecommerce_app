import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';

class OrdersInformation {
  bool status;
  List<OrderInformationData> data;

  OrdersInformation({
    required this.status,
    required this.data,
  });

  factory OrdersInformation.fromJson(Map<String, dynamic> json) =>
      OrdersInformation(
        status: json["status"],
        data: List<OrderInformationData>.from(
            json["data"].map((x) => OrderInformationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderInformationData {
  int? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? address1;
  String? address2;
  String? country;
  String? city;
  String? notes;
  String? status;
  int? total;
  String? totalAfterDiscount;
  int? userId;
  String? couponId;
  String? couponValue;
  String? orderDate;
  String? createdAt;
  String? updatedAt;
  List<Details>? details;

  OrderInformationData(
      {required this.id,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address1,
      required this.address2,
      required this.country,
      required this.city,
      required this.notes,
      required this.status,
      required this.total,
      required this.totalAfterDiscount,
      required this.userId,
      required this.couponId,
      required this.couponValue,
      required this.orderDate,
      required this.createdAt,
      required this.updatedAt,
      required this.details});

  OrderInformationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    country = json['country'];
    city = json['city'];
    notes = json['notes'];
    status = json['status'];
    total = json['total'];
    totalAfterDiscount = json['total_after_discount'];
    userId = json['user_id'];
    couponId = json['coupon_id'];
    couponValue = json['coupon_value'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['country'] = country;
    data['city'] = city;
    data['notes'] = notes;
    data['status'] = status;
    data['total'] = total;
    data['total_after_discount'] = totalAfterDiscount;
    data['user_id'] = userId;
    data['coupon_id'] = couponId;
    data['coupon_value'] = couponValue;
    data['order_date'] = orderDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  int? orderId;
  int? productId;
  String? productName;
  int? price;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  MainProduct? product;

  Details({
    this.id,
    this.orderId,
    this.productId,
    this.productName,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? MainProduct.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['price'] = price;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
