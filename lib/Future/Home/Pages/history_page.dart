import 'package:ecommerce_app_qr/Future/Home/Cubits/getMyOrders/get_my_orders_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/historyScreen/historyOrderCard.dart';
import 'package:ecommerce_app_qr/Future/Home/models/my_orders_information.dart';

import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("myOrders_screen_title".tr(context)),
        ),
        body: BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
          builder: (context, state) {
            if (state is GetMyOrdersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetMyOrdersErrorState) {
              return MyErrorWidget(
                  msg: state.msg,
                  onPressed: () {
                    context.read<GetMyOrdersCubit>().getMyOrders();
                  });
            }
            List<OrderInformationData> myOrders =
                context.read<GetMyOrdersCubit>().orderInformation?.data ?? [];
            return ListView.builder(
              itemCount: myOrders.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryCardItem(index: index, order: myOrders[index]);
              },
            );
          },
        ));
  }
}
