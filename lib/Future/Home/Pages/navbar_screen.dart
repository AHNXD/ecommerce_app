import '../../../Utils/colors.dart';
import '../Cubits/pages_cubit/pages_cubit.dart';
import '../Widgets/home_screen/drawer_widget.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/enums.dart';
import '../../../Utils/images.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),

      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: BlocBuilder<PagesScreenCubit, PageScreenState>(
        builder: (contextt, state) {
          return SafeArea(
              bottom: false,
              child: state is PagesScreenChange
                  ? Center(child: state.page)
                  : state is PageScreenInitialState
                      ? Center(child: state.page)
                      : const Text("data"));
        },
      ),
      bottomNavigationBar: BlocBuilder<PagesScreenCubit, PageScreenState>(
        builder: (context, state) {
          return Container(
            height: 7.5.h,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.w)),
            child: NavigationBar(
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: Colors.white,
              destinations: [
                NavigationDestination(
                  icon: Center(
                    child: SvgPicture.asset(
                      AppImagesAssets.home,
                    ),
                  ),
                  label: "",
                  selectedIcon: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 1.w),
                    height: 6.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                      color: AppColors.buttonCategoryColor,
                      shape: BoxShape.circle,
                      // gradient: LinearGradient(colors: grediant),
                    ),
                    child: SvgPicture.asset(
                      AppImagesAssets.home,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    AppImagesAssets.cart,
                  ),
                  label: "",
                  selectedIcon: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 1.w),
                    height: 6.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                      color: AppColors.buttonCategoryColor,
                      shape: BoxShape.circle,
                      // gradient: LinearGradient(colors: grediant),
                    ),
                    child: SvgPicture.asset(
                      AppImagesAssets.cart,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    AppImagesAssets.call,
                  ),
                  label: "",
                  selectedIcon: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 1.w),
                    height: 6.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                      color: AppColors.buttonCategoryColor,
                      shape: BoxShape.circle,
                      // gradient: LinearGradient(colors: grediant),
                    ),
                    child: SvgPicture.asset(
                      AppImagesAssets.call,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                NavigationDestination(
                    icon: Center(
                      child: SvgPicture.asset(
                        AppImagesAssets.favorite,
                      ),
                    ),
                    label: "",
                    selectedIcon: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.7.h, horizontal: 1.w),
                      height: 6.h,
                      width: 12.w,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonCategoryColor,
                        shape: BoxShape.circle,
                        // gradient: LinearGradient(colors: grediant),
                      ),
                      child: SvgPicture.asset(
                        AppImagesAssets.favorite,
                        alignment: Alignment.center,
                      ),
                    )),
              ],
              selectedIndex: state is PageScreenInitialState
                  ? state.pageType.index
                  : state is PagesScreenChange
                      ? state.pageType.index
                      : 2,
              onDestinationSelected: (index) {
                context
                    .read<PagesScreenCubit>()
                    .changedScreen(AppScreen.values[index], context);
              },
            ),
          );
        },
      ),
    );
  }
}

List<Color> grediant = <Color>[
  // const Color(0xff2553DE),
  // const Color(0xff2755DE),
  // const Color(0xff2F5BDE),
  // const Color(0xff2F5BDE),
  // Color(0xff2F5BDE),
  const Color(0xff3D65DD),
  const Color(0xff3D65DD),
  const Color(0xff3D65DD),
  const Color(0xff5073DC),
  const Color(0xff6986DB),
  const Color(0xff889DDA),
];
