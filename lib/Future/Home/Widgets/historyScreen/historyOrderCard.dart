import 'package:ecommerce_app_qr/Future/Home/Pages/order_details_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/models/my_orders_information.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';

class HistoryCardItem extends StatelessWidget {
  const HistoryCardItem({super.key, required this.order});
  final OrderInformationData order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color.fromARGB(255, 220, 236, 249)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return OrderDetailsScreen(isNotHome: false, order: order);
            }));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.buttonCategoryColor,
              child: CircleAvatar(
                  backgroundColor: order.status == "Checkout"
                      ? Colors.green
                      : order.status == ""
                          ? Colors.yellow
                          : Colors.red,
                  child: const Text("")),
            ),
            title: Text(
                textAlign: TextAlign.center,
                "${order.firstName} ${order.lastName}"),
            subtitle: Column(
              children: [
                OrderInfoTextWidget(
                  title: "phone_number".tr(context),
                  body: order.phone?.toString() ?? "",
                ),
                OrderInfoTextWidget(
                  title: "email".tr(context),
                  body: order.email?.toString() ?? "",
                ),
                OrderInfoTextWidget(
                  title: "location".tr(context),
                  body:
                      "${order.country?.toString() ?? ""},${order.city?.toString() ?? ""}",
                ),
                OrderInfoTextWidget(
                  title: "order_date".tr(context),
                  body: order.orderDate?.toString() ?? "",
                ),
                OrderInfoTextWidget(
                  title: "order_total_status".tr(context),
                  body: order.total?.toString() ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
