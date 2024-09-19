import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Utils/enums.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:ecommerce_app_qr/Utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/functions.dart';
import '../../../Utils/test_lists.dart';
import '../Cubits/searchProductsCubit/search_products_cubit.dart';

class SearchProductScreen extends StatelessWidget {
  SearchProductScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Search Product",
          style: TextStyle(
              color: AppColors.textTitleAppBarColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: TextFormField(
              controller: controller,
              validator: (s) => validation(s, ValidationState.normal),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Search Products",
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: BlocBuilder<SearchProductsCubit, SearchProductsState>(
                      builder: (context, state) {
                        return const Icon(
                          Icons.search,
                          color: AppColors.buttonCategoryColor,
                        );
                      },
                    ),
                    onPressed: () {
                      context
                          .read<SearchProductsCubit>()
                          .searchProducts(controller.text);
                    },
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4.w))),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchProductsCubit, SearchProductsState>(
                builder: (context, state) {
              if (state is SearchProductsInitial) {
                return const Center(
                  child: Text("search to any product to show resault..."),
                );
              }
              if (state is SearchProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SearchProductsErrorState) {
                return MyErrorWidget(
                  msg: state.message,
                  onPressed: () {
                    context
                        .read<SearchProductsCubit>()
                        .searchProducts(controller.text.trim());
                  },
                );
              }
              if (state is SearchProductsSuccessfulState) {
                return GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount:
                      productCardList(false, getSearchProduct(context)).length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.059.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.w,
                      mainAxisSpacing: 2.h),
                  itemBuilder: (context, index) {
                    return productCardList(
                        false, getSearchProduct(context))[index];
                  },
                );
              } else {
                return const Text("Another state");
              }
            }),
          )
        ],
      ),
    );
  }
}
