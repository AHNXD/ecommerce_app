import 'package:ecommerce_app_qr/Future/Home/Pages/navbar_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/error_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/home_screen/product_card_widget.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import '../Cubits/cartCubit/cart.bloc.dart';
import '../Cubits/getProductById/get_porduct_by_id_cubit.dart';
import '../Cubits/searchProductByCatId/search_product_by_category_id_cubit.dart';
import '../models/catigories_model.dart';
import '/Future/Home/Widgets/product_Screen/top_oval_widget.dart';
import '/Utils/colors.dart';
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
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
      String message, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(2.w)),
            margin: EdgeInsets.symmetric(horizontal: 0.1.w),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          duration: const Duration(seconds: 3)),
    );
  }

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
      child: BlocProvider(
        create: (context) => SearchProductByCategoryIdCubit(),
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddToCartState) {
              showMessage('add_product_done'.tr(context), Colors.green);
            } else if (state is AlreadyInCartState) {
              showMessage('product_in_cart'.tr(context), Colors.grey);
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
                BlocBuilder<SearchProductByCategoryIdCubit,
                    SearchProductByCategoryIdState>(
                  builder: (context, state) {
                    if (state is SearchProductByCategoryIdError) {
                      return MyErrorWidget(
                          msg: state.message, onPressed: () {});
                    } else if (state is SearchProductByCategoryIdLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchProductByCategoryIdNotFound) {
                      return Center(
                        child: Text(
                          "there_are_no_results_found".tr(context),
                        ),
                      );
                    } else if (state is SearchProductByCategoryIdSuccess) {
                      return Expanded(
                        // height: 58.h,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.083.h,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 3.w,
                                  mainAxisSpacing: 1.h),
                          itemBuilder: (context, index) {
                            return ProductCardWidget(
                              isHomeScreen: false,
                              product: state.products[index],
                              addToCartPaddingButton: 3.w,
                            );
                          },
                        ),
                      );
                    } else {
                      return CategoriesGrid(categoryId: widget.cData.id!);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.categoryId,
  });

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPorductByIdCubit, GetPorductByIdState>(
      builder: (context, state) {
        if (state is GetPorductByIdError) {
          return MyErrorWidget(
              msg: state.msg,
              onPressed: () {
                context
                    .read<GetPorductByIdCubit>()
                    .getProductsByCategory(categoryId);
              });
        } else if (state is GetPorductByIdLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetPorductByIdSuccess) {
          return Expanded(
            // height: 58.h,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.083.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 1.h),
              itemBuilder: (context, index) {
                return ProductCardWidget(
                  isHomeScreen: false,
                  product: state.products[index],
                  addToCartPaddingButton: 3.w,
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
