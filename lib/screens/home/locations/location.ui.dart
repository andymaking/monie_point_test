import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/screens/home/locations/location.vm.dart';
import 'package:monie_point_test/utils/app_logger.dart';
import 'package:monie_point_test/utils/app_strings.dart';
import 'package:monie_point_test/utils/widget_extensions.dart';
import 'package:monie_point_test/widget/app_card.dart';
import 'package:monie_point_test/widget/apptexts.dart';
import 'package:monie_point_test/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../widget/text_field.dart';
import '../../base/base-ui.dart';

class LocationScreenView extends StatelessWidget {
  const LocationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LocationServiceViewModel>(
      onModelReady: (m)=> m.init(),
      builder: (model, theme)=> Scaffold(
        body: StreamBuilder<bool>(
          stream: model.checks(),
          builder: (context, snapshot) {
            bool hasLocation = snapshot.data?? false;
            return hasLocation? SizedBox(
              height: height(context),
              width: width(context),
              child: model.center == null? Center(child: SmallLoader(),): Stack(
                children: [
                  GoogleMap(
                    style: ImageUrl.mapSetting,
                    mapType: MapType.normal,
                    // liteModeEnabled: true,
                    onMapCreated: model.onMapControllerChange,
                    // onTap: ,
                    initialCameraPosition: CameraPosition(
                      target: model.center?? LatLng(
                        0.0, // Default to 0.0 if null
                        0.0, // Default to 0.0 if null
                      ),
                      zoom: 14,
                    ),
                    markers: {
                      if (model.center != null) // Only add marker if position is available
                        Marker(
                          markerId: const MarkerId('currentLocation'),
                          position: model.center?? LatLng(
                            0.0, // Default to 0.0 if null
                            0.0, // Default to 0.0 if null
                          ),
                        ),
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SafeArea(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.sp, left: 30.sp, right: 30.sp),
                          child: Row(
                            spacing: 10.sp,
                            children: [
                              Expanded(
                                child: AppTextField(
                                  fillColor: Colors.white,
                                  controller: TextEditingController(text: "Transcorp hilton Abuja"),
                                  prefixIcon: SvgBuilder(
                                    Assets.svg.searchSvgrepoCom,
                                    color: stateColor11(false),
                                  ),
                                ),
                              ),
                              AppCard(
                                backgroundColor: Colors.white,
                                heights: 48.sp,
                                widths: 48.sp,
                                padding: 12.0.padA,
                                radius: 30.sp,
                                expandable: true,
                                child: SvgBuilder(
                                  Assets.svg.filterRectangleSvgrepoCom,
                                  color: stateColor11(false),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 90.sp, left: 30.sp, right: 30.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 10.sp,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 10.sp,
                                children: [
                                  AppCard(
                                    backgroundColor: stateColor11(false).withValues(alpha: 0.8),
                                    heights: 48.sp,
                                    widths: 48.sp,
                                    padding: 12.0.padA,
                                    radius: 30.sp,
                                    expandable: true,
                                    child: SvgBuilder(
                                      Assets.svg.walletOutlineSvgrepoCom,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    surfaceTintColor: primaryColor,
                                    position: PopupMenuPosition.over,
                                    child: AppCard(
                                      backgroundColor: stateColor11(false).withValues(alpha: 0.8),
                                      heights: 48.sp,
                                      widths: 48.sp,
                                      padding: 12.0.padA,
                                      radius: 30.sp,
                                      expandable: true,
                                      child: SvgBuilder(
                                        Assets.svg.sendSvgrepoCom,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      // Handle selected option
                                      AppLogger.debug('Selected: $value');

                                      if(value=="delete"){
                                        // model.popDeletePost(context, post?.sId??"");
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return List.generate(
                                        model.popUps.length,
                                        (index){
                                          return PopupMenuItem<String>(
                                            value: model.popUps[index].value,
                                            child: Row(
                                              spacing: 10.sp,
                                              children: [
                                                SvgBuilder(
                                                  model.popUps[index].svg,
                                                  color: stateColor10(isAppDark(context)),
                                                  size: 14.sp,
                                                ),
                                                AppText(
                                                  model.popUps[index].text,
                                                  size: 14.sp,
                                                  color: stateColor10(isAppDark(context)),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      );

                                      //   [
                                      //   const PopupMenuItem<String>(
                                      //     value: 'delete',
                                      //     child: AppText("Delete", color: Colors.red, size: 16,),
                                      //   ),
                                      // ];
                                    },
                                  ),
                                ],
                              ),
                              AppCard(
                                backgroundColor: stateColor11(false).withValues(alpha: 0.8),
                                heights: 48.sp,
                                padding: 12.0.padA,
                                radius: 30.sp,
                                expandable: true,
                                child: Row(
                                  spacing: 5.sp,
                                  children: [
                                    SvgBuilder(
                                      Assets.svg.listSvgrepoCom,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                    AppText("List of Variants", color: Colors.white, weight: FontWeight.w500,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) : Center(child: AppText("Enable Location to proceed"),);
          }
        ),
      ),
    );
  }
}
