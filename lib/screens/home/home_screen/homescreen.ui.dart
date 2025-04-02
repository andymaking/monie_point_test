import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/data/models/temp_property_model.dart';
import 'package:monie_point_test/utils/widget_extensions.dart';
import 'package:monie_point_test/widget/app_card.dart';
import 'package:monie_point_test/widget/apptexts.dart';
import 'package:monie_point_test/widget/default_profile_pic.dart';
import 'package:monie_point_test/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/app_strings.dart';
import '../../../widget/custom_image_widget.dart';
import '../../base/base-ui.dart';
import 'homescreen.vm.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => model.initAnimation(this),
      onDisposeModel: (m)=> m.disposeVm(),
      builder: (model, theme)=> Container(
        height: height(context),
        width: width(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [whitePrimaryColor, primaryColor.withValues(alpha: 0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 1]
            // stops: [0.1, 0.3, 1]
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInLeft(
                  child: AppCard(
                    color: Colors.white,
                    padding:EdgeInsets.symmetric(horizontal: 10.sp, vertical: 6.sp),
                    expandable: true,
                    // useShadow: true,
                    radius: 10.sp,
                    child: FadeIn(
                      child: Row(
                        spacing: 5.sp,
                        children: [
                          SvgBuilder(Assets.svg.locationSvgrepoCom, color: secondaryColor,),
                          AppText(AppString.stPetersburg, color: secondaryColor, weight: FontWeight.w400,)
                        ],
                      ),
                    ),
                  ),
                ),
                ZoomIn(
                  child: ProfilePic(
                    username: "user",
                    size: 40.sp,
                  ),
                )
              ],
            ),
          ),
          body: ListView(
            padding: 0.sp.padA,
            children: [
              AnimatedBuilder(
                animation: model.animation1,
                builder: (_, c){
                  return Padding(
                    padding: 16.sp.padH,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.sp.sbH,

                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.animation1.value) * 60),
                          child: FadeTransition(
                            opacity: model.animation2,
                            child: AppText(
                              AppString.hiMarina,
                              color: secondaryColor,
                              weight: FontWeight.w500,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.animation2.value) * 60),
                          child: FadeTransition(
                            opacity: model.animation2,
                            child: AppText(
                              AppString.letsCreateYourPlace,
                              weight: FontWeight.w500,
                              size: 30.sp,
                              color: stateColor12(false),
                              height: 1.2,
                            ),
                          ),
                        ),
                        25.sp.sbH,
                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.animation3.value) * 0),
                          child: Row(
                            spacing: 16.sp,
                            children: [
                              Expanded(
                                  child: LayoutBuilder(
                                      builder: (context, constraint) {
                                        double width = constraint.maxWidth;
                                        return AppCard(
                                          heights: width,
                                          padding: 20.sp.padA,
                                          radius: width/2,
                                          backgroundColor: primaryColor,
                                          child: Column(
                                            children: [
                                              AppText(
                                                AppString.buy.toUpperCase(),
                                                color: Colors.white,
                                                weight: FontWeight.w500,
                                              ),
                                              20.sp.sbH,
                                              Countup(
                                                begin: 0,
                                                end: 1034,
                                                duration: Duration(seconds: 1),
                                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 35.sp
                                                ),
                                              ),
                                              AppText(
                                                AppString.offers,
                                                color: Colors.white,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  )
                              ),
                              Expanded(
                                  child: LayoutBuilder(
                                      builder: (context, constraint) {
                                        double width = constraint.maxWidth;
                                        return AppCard(
                                          heights: width,
                                          padding: 20.sp.padA,
                                          backgroundColor: lightPrimaryColor,
                                          child: Column(
                                            children: [
                                              AppText(
                                                AppString.buy.toUpperCase(),
                                                color: secondaryColor,
                                                weight: FontWeight.w500,
                                              ),
                                              20.sp.sbH,
                                              Countup(
                                                begin: 0,
                                                end: 2212,
                                                duration: Duration(seconds: 1),
                                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                    color: secondaryColor,
                                                    fontSize: 35.sp
                                                ),
                                              ),
                                              AppText(
                                                AppString.offers,
                                                color: secondaryColor,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  )
                              ),
                            ],
                          ),
                        ),
                        25.sp.sbH,
                      ],
                    ),
                  );
                },
              ),
              SlideInUp(
                child: AppCard(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.only(
                    top: 10.sp,
                    left: 10.sp,
                    right: 10.sp,
                    bottom: 100.sp,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  child: CustomImageLayout(
                    images: model.properties,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
