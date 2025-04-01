import 'package:animate_do/animate_do.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/data/models/temp_property_model.dart';
import 'package:monie_point_test/utils/widget_extensions.dart';
import 'package:monie_point_test/widget/app_card.dart';
import 'package:monie_point_test/widget/apptexts.dart';
import 'package:monie_point_test/widget/default_profile_pic.dart';
import 'package:monie_point_test/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/app_strings.dart';
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
            colors: [stateColor2(isAppDark(context)), primaryColor.withValues(alpha: 0.1), primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                animation: model.itemAnimations[0],
                builder: (_, c){
                  return Padding(
                    padding: 16.sp.padH,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.sp.sbH,

                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.itemAnimations[0].value) * 60),
                          child: AppText(
                            AppString.hiMarina,
                            color: secondaryColor,
                            weight: FontWeight.w500,
                            size: 20.sp,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.itemAnimations[1].value) * 60),
                          child: AppText(
                            AppString.letsCreateYourPlace,
                            weight: FontWeight.w500,
                            size: 30.sp,
                            color: stateColor12(isAppDark(context)),
                            height: 1.2,
                          ),
                        ),
                        25.sp.sbH,
                        Transform.translate(
                          offset: Offset(0.0, (1.0 - model.itemAnimations[2].value) * 60),
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
                        10.sp.sbH,
                      ],
                    ),
                  );
                },
              ),
              Transform.translate(
                offset: Offset(-0.0, (1.0 - model.itemAnimations[5].value) * 60),
                child: SlideInUp(
                  child: AppCard(
                    padding: 10.sp.padA,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    ),
                    child: CustomImageLayout(
                      images: model.properties,
                    ),
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


class CustomImageLayout extends StatelessWidget {
  final List<TempProperty> images;

  const CustomImageLayout({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final screenWidth = width(context) - (10.sp + 20.sp);

    List<Widget> buildGroup(List<TempProperty> group) {
      switch (group.length) {
        case 1:
          return [
            Row(
              children: [
                CardView(
                  height: screenWidth / 2,
                  image: group[0].url,
                  index: 0
                ),
              ],
            ),
            10.sp.sbH,
          ];
        case 2:
          return [
            Row(
              spacing: 10.sp,
              children: [
                CardView(
                  height: screenWidth / 2,
                  image: group[0].url,
                  index: 0
                ),
                CardView(
                  height: screenWidth / 2,
                  image: group[1].url,
                  index: 1,
                ),
              ],
            ),
          ];
        case 3:
          return [
            Row(
              children: [
                CardView(
                  height: screenWidth / 2,
                  image: group[0].url,
                  index: 0
                ),
              ],
            ),
            10.sp.sbH,
            Row(
              spacing: 10.sp,
              children: [
                CardView(
                  height: screenWidth / 2,
                  image: group[1].url,
                  index: 1
                ),
                CardView(
                  height: screenWidth / 2,
                  image: group[2].url,
                  index: 2
                ),
              ],
            ),
          ];
        case 4:
          return [
            Row(
              children: [
                CardView(
                  height: screenWidth / 2,
                  image: group[0].url,
                  index: 0
                ),
              ],
            ),
            10.sp.sbH,
            Row(
              spacing: 10.sp,
              children: [
                CardView(
                  height: screenWidth,
                  image: group[1].url,
                  index: 1,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: screenWidth,
                    child: Column(
                      spacing: 10.sp,
                      children: [
                        CardView(
                          height: (screenWidth/2) - 5.sp,
                          image: group[2].url,
                          index: 2,
                        ),
                        CardView(
                          height: (screenWidth/2) - 5.sp,
                          image: group[3].url,
                          index: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ];
        default:
          return [];
      }
    }

    List<Widget> buildAllGroups() {
      List<Widget> allGroups = [];
      for (int i = 0; i < images.length; i += 4) {
        final group = images.sublist(
            i, i + 4 > images.length ? images.length : i + 4);
        allGroups.addAll(buildGroup(group));
        if (i + 4 < images.length) {
          allGroups.add(const SizedBox(height: 8)); // Spacing between groups
        }
      }
      return allGroups;
    }

    return SingleChildScrollView(
      child: Column(
        children: buildAllGroups(),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.height,
    required this.image,
    this.width,
    required this.index,
  });

  final double? width;
  final double height;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInUp(
        duration: Duration(milliseconds: 400),
        delay: Duration(milliseconds: 100 * index), // stagger
        child: AppCard(
          widths: width,
          heights: height,
          fit: BoxFit.cover,
          radius: 20.sp,
          padding: 0.0.padA,
          backgroundImage: image,
        ),
      ),
    );
  }
}