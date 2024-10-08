import 'package:ecommerce_app_qr/Future/Auth/Widgets/my_button_widget.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/GetCatigoriesOffers/get_catigories_offers_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/favoriteCubit/favorite_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/getCatigories/get_catigories_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/getMyOrders/get_my_orders_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/getProducts/get_products_cubit.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/about_us_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/maintenance_order.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/print_image.dart';
import 'package:ecommerce_app_qr/Future/Home/Pages/sell_prodact.dart';
import 'package:ecommerce_app_qr/Future/Home/Cubits/locale/locale_cubit.dart';
import 'package:ecommerce_app_qr/Utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:ecommerce_app_qr/Utils/app_localizations.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:ecommerce_app_qr/Utils/constants.dart';
import 'package:ecommerce_app_qr/Utils/functions.dart';
import 'package:ecommerce_app_qr/Utils/images.dart';
import 'package:ecommerce_app_qr/Utils/services/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Cubits/cartCubit/cart.bloc.dart';
import '../../Pages/contact_us_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 140.sp,
                width: 140.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    AppImagesAssets.logoNoBg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              MyButtonWidget(
                  text: "contact_us".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "about_us".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "sell_product".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SellProdact()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "maintenance_btn".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MaintenanceScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              MyButtonWidget(
                  text: "print_image_order_btn".tr(context),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PrintImageScreen()));
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.buttonCategoryColor),
              const Spacer(),
              !AppSharedPreferences.hasToken
                  ? Column(
                      children: [
                        MyButtonWidget(
                            text: "logIn".tr(context),
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                        MyButtonWidget(
                            text: "signUp".tr(context),
                            onPressed: () {},
                            verticalHieght: 1.h,
                            horizontalWidth: 2.w,
                            color: AppColors.offersContainerColor),
                      ],
                    )
                  : MyButtonWidget(
                      text: "logOut".tr(context),
                      onPressed: () {},
                      verticalHieght: 1.h,
                      horizontalWidth: 2.w,
                      color: AppColors.textTitleAppBarColor),
              MyButtonWidget(
                  text: "language".tr(context),
                  onPressed: () async {
                    String langCode =
                        await SaveService.retrieve("LOCALE") ?? "en";
                    lang = langCode == "en" ? "ar" : "en";
                    context.read<LocaleCubit>().changeLanguage(lang);
                    context.read<GetCatigoriesCubit>().getCatigories();
                    context
                        .read<GetCatigoriesOffersCubit>()
                        .getOffersCatigories();
                    context.read<GetProductsCubit>().getProducts();
                    context.read<FavoriteCubit>().getProductsFavorite();
                    context.read<GetMyOrdersCubit>().getMyOrders();
                    context.read<CartCubit>().refreshCartOnLanguageChange();

                    await Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pop(context);
                      massege(context, "change_lang".tr(context), Colors.green);
                    });
                  },
                  verticalHieght: 1.h,
                  horizontalWidth: 2.w,
                  color: AppColors.textTitleAppBarColor),
            ],
          ),
        ),
      ),
    );
  }
}
