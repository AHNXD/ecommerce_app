import 'package:ecommerce_app_qr/Future/Home/models/my_orders_information.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(
      {super.key, required this.isNotHome, required this.order});
  final bool isNotHome;
  final OrderInformationData order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
                (states) => AppColors.buttonCategoryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            AppImagesAssets.back,
            height: 3.h,
          ),
          color: Colors.white,
          iconSize: 20.sp,
        ),
        title: Text("orderDetails_screen_title".tr(context)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(order.phone.toString()),
            Text(order.email.toString()),
            Text("${order.country} ${order.city}"),
            Text(order.address1.toString()),
            Text(order.address2.toString()),
            // Text(order.code.toString()),
            // Text(order.note.toString()),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: order.productId?.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         leading: CircleAvatar(
            //           backgroundColor: AppColors.buttonCategoryColor,
            //           child: Text(order.quantity![index].toString()),
            //         ),
            //         title: Text(
            //             "Product Name: ${order.productId![index].toString()}"),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
