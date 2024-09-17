import 'package:ecommerce_app_qr/Future/Home/Pages/navbar_screen.dart';
import '../Cubits/getCatigories/get_catigories_cubit.dart';
import '../models/catigories_model.dart';
import '/Future/Home/Widgets/product_Screen/top_oval_widget.dart';
import '/Utils/colors.dart';
import '/Utils/functions.dart';
import '/Utils/test_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key, required this.cData, required this.isNotHome});
  // final int clickIndex;
  final CatigoriesData cData;
  final bool isNotHome;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!widget.isNotHome) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (builder) {
            return const NavBarPage();
          }));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            TopOvalWidget(
              isNotHome: widget.isNotHome,
              firstText: widget.cData.name!,
              parentId: widget.cData.id!,
            ),
            BlocBuilder<GetCatigoriesCubit, GetCatigoriesState>(
              builder: (context, state) {
                return Expanded(
                  // height: 58.h,
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: getGridById(widget.cData.id!, context).length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.059.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 2.h),
                    itemBuilder: (context, index) {
                      return productCardList(
                          false, getGridById(widget.cData.id!, context))[index];
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
