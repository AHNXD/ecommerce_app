// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:ecommerce_app_qr/Future/Home/Pages/product_screen.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/functions.dart';

class CategoriesButtonWidget extends StatefulWidget {
  const CategoriesButtonWidget({
    super.key,
    required this.firstText,
    required this.parentId,
  });

  final String firstText;
  final parentId;
  @override
  State<CategoriesButtonWidget> createState() => _CategoriesButtonWidgetState();
}

class _CategoriesButtonWidgetState extends State<CategoriesButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getCategoryByParentId(widget.parentId, context).length + 1,
      itemBuilder: (context, index) {
        List l = getCategoryByParentId(widget.parentId, context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: MaterialButton(
            animationDuration: const Duration(seconds: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.w)),
            color: index == 0 ? const Color.fromARGB(255, 251, 254, 255) : null,
            onPressed: () {
              if (index != 0) {
                //context.read<GetProductsCubit>().getProductsByCategory();
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return ProductScreen(
                    cData: l[index - 1],
                    isNotHome: true,
                  );
                }));
              }
            },
            child: Text(
              index == 0 ? widget.firstText : l[index - 1].name!,
              style: TextStyle(
                  color:
                      index == 0 ? AppColors.textButtonColors : Colors.white),
            ),
          ),
        );
        // }
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
