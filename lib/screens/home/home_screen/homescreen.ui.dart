import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/utils/widget_extensions.dart';
import 'package:monie_point_test/widget/app_card.dart';
import 'package:monie_point_test/widget/apptexts.dart';
import 'package:monie_point_test/widget/default_profile_pic.dart';
import 'package:monie_point_test/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/app_strings.dart';
import '../../base/base-ui.dart';
import 'homescreen.vm.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      builder: (model, theme)=> Container(
        height: height(context),
        width: width(context),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [stateColor2(isAppDark(context)), primaryColor.withValues(alpha: 0.1), primaryColor],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   // stops: [0.1, 0.3, 1]
          // )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInLeft(
                  child: AppCard(
                    expandable: true,
                    // useShadow: true,
                    radius: 10.sp,
                    child: Row(
                      spacing: 5.sp,
                      children: [
                        SvgBuilder(Assets.svg.locationSvgrepoCom, color: secondaryColor,),
                        AppText(AppString.stPetersburg, color: secondaryColor, weight: FontWeight.w400,)
                      ],
                    ),
                  ),
                ),
                SlideInRight(
                  child: ProfilePic(
                    username: "user",
                    size: 40.sp,
                  ),
                )
              ],
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
