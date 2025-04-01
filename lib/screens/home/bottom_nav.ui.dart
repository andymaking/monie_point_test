import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_test/app_theme/palette.dart';

import '../../utils/widget_extensions.dart';
import '../../widget/app_card.dart';
import '../../widget/svg_builder.dart';
import '../base/base-ui.dart';
import 'bottom_nav.vm.dart';

class BottomNavigationScreen extends StatelessWidget {
  final int initialIndex;
  final bool goToProfile;
  const BottomNavigationScreen({super.key, this.initialIndex = 0, this.goToProfile = false});

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      onModelReady: (m)=> m.init(initialIndex),
      builder: (model, theme)=> Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: height(context),
              width: width(context),
              child: model.screens[model.index],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.sp),
                  child: SlideInUp(
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppCard(
                            expandable: true,
                            radius: 100.sp,
                            padding: 5.sp.padA,
                            color: Color(0xFF2b2b2b),
                            child: Column(
                              children: [
                                Row(
                                  spacing: 10.sp,
                                  children: List.generate(
                                    model.navs.length,
                                    (index){
                                      return BottomNavView(
                                        index: index,
                                        currentIndex: model.index,
                                        onTap: model.changeIndex,
                                        navType: model.navs[index],
                                      );
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BottomNavView extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final NavType navType;
  const BottomNavView({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.navType
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: ()=> onTap(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: index == currentIndex? 55: 40.sp,
            width: index == currentIndex? 55: 40.sp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex? primaryColor: Color(0xFF222220),
            ),
            child: SvgBuilder(navType.activeIcon, color: Colors.white, size: 20.sp,),
          )
          ,
        ],
      ),
    );
  }
}
