import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/utils/widget_extensions.dart';

import '../gen/assets.gen.dart';
import 'svg_builder.dart';

class ZoomInAnimation extends StatefulWidget {
  const ZoomInAnimation({Key? key}) : super(key: key);

  @override
  State<ZoomInAnimation> createState() => _ZoomInAnimationState();
}

class _ZoomInAnimationState extends State<ZoomInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstItemAnimation;
  late Animation<double> _secondItemAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4), // Total duration: 4 seconds
      vsync: this,
    );

    // First item animation: 0.0 to 1.0 from 0.0 to 0.375 (1.5 seconds)
    _firstItemAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.375, curve: Curves.easeOut),
      ),
    );

    // Second item animation: 0.0 to 1.0 from 0.375 to 1.0 (2 seconds)
    _secondItemAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.375, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _firstItemAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _firstItemAnimation.value,
              child: Container(
                height: 68.sp,
                width: 68.sp,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _secondItemAnimation,
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.only(top: _secondItemAnimation.value*30),
              child: Transform.scale(
                scale: _secondItemAnimation.value,
                child: SvgBuilder(
                  Assets.svg.buildingSvgrepoCom,
                  size: 40.sp,
                  color: black(isAppDark(context)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}


class HoverAnimation extends StatefulWidget {
  const HoverAnimation({super.key});

  @override
  State<HoverAnimation> createState() => _HoverAnimationState();
}

class _HoverAnimationState extends State<HoverAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstItemAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Total duration: 4 seconds
      vsync: this,
    );

    // First item animation: 0.0 to 1.0 from 0.0 to 0.375 (1.5 seconds)
    _firstItemAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.375, curve: Curves.bounceInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _firstItemAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _firstItemAnimation.value,
          child: Container(
            height: 55.sp,
            width: 55.sp,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle
            ),
          ),
        );
      },
    );
  }
}