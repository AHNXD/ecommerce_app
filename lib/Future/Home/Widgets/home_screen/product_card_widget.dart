import '/Future/Home/Cubits/favoriteCubit/favorite_cubit.dart';
import '/Apis/Urls.dart';
import '../../Cubits/cartCubit/cart.bloc.dart';
import '/Future/Home/Pages/product_details.dart';
import '/Future/Home/models/product_model.dart';
import '/Utils/colors.dart';
import '/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../cached_network_image.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.isHomeScreen,
    required this.product,
  });
  final bool isHomeScreen;
  final MainProduct product;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  // int number = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return DetailPage(
            product: widget.product,
          );
        }));
      },
      child: Container(
        // width: 70.w,
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w), color: Colors.white),
        child: Column(
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.product.isFavorite) {
                            context
                                .read<FavoriteCubit>()
                                .addAndDelFavoriteProducts(
                                  widget.product.id!,
                                );
                            widget.product.isFavorite = false;
                          } else {
                            context
                                .read<FavoriteCubit>()
                                .addAndDelFavoriteProducts(
                                  widget.product.id!,
                                );
                            widget.product.isFavorite = true;
                          }
                        });
                      },
                      icon: Icon(
                        widget.product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: widget.product.isFavorite
                            ? AppColors.textTitleAppBarColor
                            : Colors.black,
                      )),
                );
              },
            ),
            if (widget.product.files != null)
              MyCachedNetworkImage(
                height: 25.h,
                width: 40.w,
                imageUrl: widget.product.files![0].path != null
                    ? Urls.storageProducts + widget.product.files![0].name!
                    : widget.product.files![0].name!,
                // height: 10.h,
              ),
            Text(widget.product.name!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textButtonColors,
                  fontSize: 15.sp,
                )),
            if (widget.product.weightMeasurement != null)
              Text(
                  "${widget.product.wight} ${widget.product.weightMeasurement!.name}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 10.sp,
                  )),
            SizedBox(
              height: 1.h,
            ),
            if (widget.product.newSellingPrice != null)
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 17.w, top: 2.h, left: 4.w),
                    child: Text(
                      "${widget.product.newSellingPrice} Sp",
                      style: TextStyle(
                          color: AppColors.textButtonColors,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Positioned(
                    bottom: 2.h,
                    left: 18.w,
                    child: Text(
                      "${widget.product.sellingPrice} Sp",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.textButtonColors,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            else
              Text(
                "${widget.product.sellingPrice} Sp",
                style: TextStyle(
                    color: AppColors.textButtonColors,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w900),
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              padding: EdgeInsets.only(right: 1.w),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // if (widget.product.userQuantity > 0)
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.buttonCategoryColor,
                    ),
                    onPressed: () {
                      if (widget.product.userQuantity == 0) {
                        context.read<CartCubit>().addToCart(widget.product);
                      }
                      setState(() {
                        if (widget.product.userQuantity <
                            widget.product.quantity!) {
                          widget.product.userQuantity++;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: widget.product.userQuantity < 0 ? 0 : 1.w,
                    ),
                    child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Text(
                          // widget.product.userQuantity == 0
                          //     ? "Add To Cart"
                          //     :
                          "${widget.product.userQuantity < 10 && widget.product.userQuantity != 0 ? "0" : ""}${widget.product.userQuantity}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: widget.isHomeScreen ? 13.sp : 9.sp,
                              fontWeight: FontWeight.w400),
                        );
                      },
                    ),
                  ),
                  // if (widget.product.userQuantity > 0)
                  IconButton(
                    icon: const Icon(Icons.remove,
                        color: AppColors.buttonCategoryColor),
                    onPressed: () {
                      setState(() {
                        if (widget.product.userQuantity == 1) {
                          context
                              .read<CartCubit>()
                              .removeformTheCart(widget.product);
                          widget.product.userQuantity--;
                        } else if (widget.product.userQuantity > 0) {
                          widget.product.userQuantity--;
                        }
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
