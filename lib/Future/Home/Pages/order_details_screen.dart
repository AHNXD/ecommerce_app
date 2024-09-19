import 'package:ecommerce_app_qr/Future/Home/Pages/navbar_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/models/order_information.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(
      {super.key, required this.isNotHome, required this.order});
  final bool isNotHome;
  final OrderInformation order;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  if (!isNotHome) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) {
                      return const NavBarPage();
                    }));
                  }
                },
                icon: const Icon(Icons.arrow_back_ios_new))
          ],
          title: const Text("Order Details"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(order.phone.toString()),
              Text(order.email.toString()),
              Text("${order.country} ${order.city}"),
              Text(order.address1.toString()),
              Text(order.address2.toString()),
              Text(order.code.toString()),
              Text(order.note.toString()),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: order.productId?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.buttonCategoryColor,
                        child: Text(order.quantity![index].toString()),
                      ),
                      title: Text(
                          "Product Name: ${order.productId![index].toString()}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
