import 'package:ecommerce_app_qr/Apis/Urls.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/navbar_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/size_selector.dart';
import 'package:ecommerce_app_qr/Future/Home/models/product_model.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../Cubits/cartCubit/cart.bloc.dart';
import '../Cubits/favoriteCubit/favorite_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.product,
  });
  final MainProduct product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
              style: TextStyle(fontSize: 18),
            ),
          ),
          duration: const Duration(seconds: 5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) {
          return const NavBarPage();
        }));
      },
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartState) {
            showMessage('add_product_done'.tr(context), Colors.green);
          } else if (state is AlreadyInCartState) {
            showMessage('product_in_cart'.tr(context), Colors.grey);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColors,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              // detail header
              detailItemsHeader(),
              // for image
              detailImage(),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // For name
                              Center(
                                child: Text(
                                  widget.product.name!,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 34),
                                ),
                              ),
                              // For price
                              Center(
                                child: Text(
                                  '${widget.product.newSellingPrice != null ? widget.product.newSellingPrice : widget.product.sellingPrice} ${"sp".tr(context)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: AppColors.primaryColors),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // For items widget.product.userQuantity
                        // Material(
                        //   color: AppColors.primaryColors,
                        //   borderRadius: BorderRadius.circular(30),
                        //   child: Row(
                        //     children: [
                        //       IconButton(
                        //         onPressed: () {
                        //           if (widget.product.userQuantity > 1) {
                        //             widget.product.userQuantity -= 1;
                        //             setState(() {});
                        //           }
                        //           if (widget.product.userQuantity == 1) {
                        //             widget.product.userQuantity = 0;
                        //             context
                        //                 .read<CartCubit>()
                        //                 .removeformTheCart(widget.product);
                        //             setState(() {});
                        //           }
                        //         },
                        //         icon: const Icon(
                        //           Icons.remove,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         width: 4,
                        //       ),
                        //       Text(
                        //         "${widget.product.userQuantity}",
                        //         style: const TextStyle(
                        //             color: Colors.white, fontSize: 25),
                        //       ),
                        //       const SizedBox(
                        //         width: 4,
                        //       ),
                        //       IconButton(
                        //         onPressed: () {
                        //           if (widget.product.userQuantity == 0) {
                        //             context
                        //                 .read<CartCubit>()
                        //                 .addToCart(widget.product);
                        //           }
                        //           if (widget.product.userQuantity <
                        //               widget.product.quantity!) {
                        //             widget.product.userQuantity++;
                        //           }

                        //           setState(() {});
                        //         },
                        //         icon: const Icon(
                        //           Icons.add,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      children: [
                        // For rating
                        if (widget.product.ratings == null ||
                            widget.product.ratings == [])
                          const SizedBox()
                        else
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (widget.product.ratings == null ||
                            widget.product.ratings == [])
                          const SizedBox()
                        else
                          Text(
                            "${widget.product.ratings![0].rating}",
                            style: const TextStyle(
                                color: Colors.black38, fontSize: 18),
                          ),
                        const Spacer(),
                        // For kcla
                        const Icon(
                          Icons.fiber_manual_record,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        if (widget.product.wight != null)
                          Text(
                            '${widget.product.wight} ${widget.product.weightMeasurement!.name}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        const Spacer(),
                        // For time
                        const Icon(
                          Icons.access_time_filled,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        // Text(
                        //   widget.product.cookingTime,
                        //   maxLines: 1,
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 16),
                        // ),
                      ],
                    ),
                    // For description
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.descrption!,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    // For add to cart button
                    const SizedBox(
                      height: 25,
                    ),
                    SizeSelector(category: widget.product.category!.name!),
                    const SizedBox(
                      height: 25,
                    ),
                    Material(
                      color: AppColors.primaryColors,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          context.read<CartCubit>().addToCart(widget.product);
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 21),
                          child: Text(
                            "add_to_cart".tr(context),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox detailImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          ),
          if (widget.product.files != null)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColors[400]!,
                        blurRadius: 15,
                        offset: const Offset(0, 8))
                  ],
                  borderRadius: BorderRadius.circular(250),
                ),
                child: CircleAvatar(
                    radius: 25.w,
                    // borderRadius: BorderRadius.circular(250),
                    backgroundImage: NetworkImage(
                      widget.product.files![0].path != null
                          ? Urls.storageProducts +
                              widget.product.files![0].name!
                          : widget.product.files![0].name!,
                      // height: 10.h,
                    )),
              ),
            )
        ],
      ),
    );
  }

  Padding detailItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // For back button
          Material(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(10),
            child: BackButton(
              onPressed: () => setState(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) {
                  return const NavBarPage();
                }));
              }),
              color: Colors.white,
            ),
          ),
          const Spacer(),
          // For detail food
          Text(
            "product_detail_screen_title".tr(context),
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                if (widget.product.isFavorite) {
                  context
                      .read<FavoriteCubit>()
                      .addAndDelFavoriteProducts(widget.product.id!);
                  widget.product.isFavorite = false;
                } else {
                  context
                      .read<FavoriteCubit>()
                      .addAndDelFavoriteProducts(widget.product.id!);
                  widget.product.isFavorite = true;
                }
              });
            },
            child: Material(
              color: Colors.white.withOpacity(0.21),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: Icon(
                    widget.product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: widget.product.isFavorite
                        ? AppColors.textTitleAppBarColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// design is completed
