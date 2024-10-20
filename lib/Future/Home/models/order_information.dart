class OrderInformation {
  List<int>? productId;
  List<int>? quantity;
  List<String?>? selectedSizes;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? address1;
  String? address2;
  String? country;
  String? city;
  String? note;
  String? code;
  OrderInformation(
      {this.address1,
      this.code,
      this.address2,
      this.city,
      this.country,
      this.email,
      this.firstName,
      this.lastName,
      this.note,
      this.phone,
      this.productId,
      this.quantity,
      this.selectedSizes});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "qty": quantity,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "address_1": address1,
      "address_2": address2,
      "country": country,
      "city": city,
      "notes": note,
      "code": code,
      "sizes": selectedSizes
    };
  }
}
