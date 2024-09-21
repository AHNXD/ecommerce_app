import 'package:ecommerce_app_qr/Future/Home/Pages/order_details_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/models/my_orders_information.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';

class HistoryCardItem extends StatelessWidget {
  const HistoryCardItem({super.key, required this.index, required this.order});
  final OrderInformationData order;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color.fromARGB(255, 220, 249, 247)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return OrderDetailsScreen(isNotHome: false, order: order);
            }));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.buttonCategoryColor,
              child: Text((index + 1).toString()),
            ),
            trailing: CircleAvatar(
                backgroundColor: index % 3 == 0
                    ? Colors.green
                    : index % 3 == 1
                        ? Colors.yellow
                        : Colors.red,
                child: const Text("")),
            title: Text(
                textAlign: TextAlign.center,
                "${order.firstName} ${order.lastName}"),
            subtitle: Column(
              children: [
                Text(order.phone.toString()),
                Text(order.email.toString()),
                Text("${order.country} ${order.city}"),
                Text(order.address1.toString()),
                Text(order.address2.toString()),
                // Text(order.code.toString()),
                // Text(order.note.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
