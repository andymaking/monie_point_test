import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import '../data/models/temp_property_model.dart';
import '../utils/widget_extensions.dart';
import 'app_card.dart';
import 'apptexts.dart';

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
                    index: 0,
                    text: group[0].location,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    index: 0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    text: group[0].location
                ),
                CardView(
                    height: screenWidth / 2,
                    image: group[1].url,
                    index: 1,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    text: group[1].location
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
                    index: 0,
                    text: group[0].location,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    text: group[1].location,
                    index: 1
                ),
                CardView(
                    height: screenWidth / 2,
                    image: group[2].url,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    text: group[2].location,
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
                    index: 0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    text: group[0].location
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    text: group[1].location
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          text: group[2].location,
                        ),
                        CardView(
                            height: (screenWidth/2) - 5.sp,
                            image: group[3].url,
                            index: 3,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            text: group[3].location
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
    required this.index, required this.text, required this.crossAxisAlignment,
  });

  final double? width;
  final CrossAxisAlignment crossAxisAlignment;
  final double height;
  final String image;
  final String text;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedWidthWidget(
                child: text,
                crossAxisAlignment: crossAxisAlignment,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedWidthWidget extends StatefulWidget {
  final String child;
  final CrossAxisAlignment crossAxisAlignment;

  const AnimatedWidthWidget({super.key, required this.child, required this.crossAxisAlignment});

  @override
  _AnimatedWidthWidgetState createState() => _AnimatedWidthWidgetState();
}

class _AnimatedWidthWidgetState extends State<AnimatedWidthWidget> {
  double _width = 40; // Initial width
  double? _maxWidth; // Will store the max available width

  @override
  void initState() {
    super.initState();
    print(widget.crossAxisAlignment);
    // Start animation after build completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_maxWidth != null) {
        setState(() {
          _width = _maxWidth!; // Animate to max available width
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Store the max width on first build
        _maxWidth ??= constraints.maxWidth;

        return AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: _width,
          margin: 16.sp.padA,
          curve: Curves.easeInOut,
          child: GlassContainer(child: Stack(
            children: [
              SizedBox(
                width: width(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: widget.crossAxisAlignment == CrossAxisAlignment.center? CrossAxisAlignment.center:  CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: widget.crossAxisAlignment == CrossAxisAlignment.start? MainAxisAlignment.start: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: 10.sp.padH,
                          child: AppText(
                            widget.child,
                            isTitle: true,
                            size: 13.sp,
                            color: stateColor11(false),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppCard(
                  heights: 35.sp,
                  margin: 2.5.sp.padA,
                  padding: 0.sp.padA,
                  backgroundColor: stateColor1(false),
                  widths: 35.sp,
                  useShadow: true,
                  radius: 20.sp,
                  child: Center(child: Icon(
                    CupertinoIcons.forward, size: 15.sp,
                    color: stateColor9(false),
                  )),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}

// The GlassContainer widget:
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;

  const GlassContainer({
    Key? key,
    required this.child,
    this.blur = 5.0,
    this.opacity = 0.6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          height: 40.sp,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}