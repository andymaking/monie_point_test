import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_test/app_theme/palette.dart';
import 'package:monie_point_test/widget/app_card.dart';
import 'package:monie_point_test/widget/apptexts.dart';

//TODO: uncomment if using a pdf functionality
// import 'package:pdf/pdf.dart';

const ext = 0;

double screenHeight(BuildContext context, double height) {
  return MediaQuery.of(context).size.height / height;
}

double screenWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width / width;
}
double screenSize(BuildContext context, double pixel){
  double xHeight = pixel / MediaQuery.of(context).size.width * 100;
  return MediaQuery.of(context).size.width * xHeight /100;
}

extension WidgetExtensions on double {
  Widget get sbH => SizedBox(
        height: h,
      );

  Widget get sbW => SizedBox(
        width: w,
      );

  Widget get sbHW => SizedBox(
        width: w,
        height: h,
  );

  EdgeInsetsGeometry get padA => EdgeInsets.all(this);

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);
  EdgeInsetsGeometry get padT => EdgeInsets.only(top: h);
  EdgeInsetsGeometry get padL => EdgeInsets.only(left: h);
  EdgeInsetsGeometry get padR => EdgeInsets.only(right: h);
  EdgeInsetsGeometry get padB => EdgeInsets.only(bottom: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

class SpaceH extends StatelessWidget {
  final double h;
  const SpaceH(this.h,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h/MediaQuery.of(context).devicePixelRatio,
    );
  }
}

bool isAppDark(BuildContext context) {
  return Theme.of(context).scaffoldBackgroundColor == const Color(0xFF111113);
}

class SpaceW extends StatelessWidget {
  final double w;
  const SpaceW(this.w,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w/MediaQuery.of(context).devicePixelRatio,
    );
  }
}


double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Future<Uint8List> getBytesFromWidget(Widget widget, {int width = 100}) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  final size = Size(width.toDouble(), width.toDouble());

  final RenderRepaintBoundary boundary = RenderRepaintBoundary();

  final painter = RenderRepaintBoundary();

  final RenderBox renderBox = RenderPadding(
    padding: EdgeInsets.all(0),
    child: RenderPositionedBox(
      alignment: Alignment.center,
      child: boundary,
    ),
  );

  final repaintBoundary = RenderRepaintBoundary();
  final buildContext = OverlayEntry(builder: (_) => RepaintBoundary(child: widget));
  final image = await repaintBoundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}


class MarkerWidget extends StatefulWidget {
  final String text;

  const MarkerWidget(this.text, {Key? key}) : super(key: key);

  @override
  _MarkerWidgetState createState() => _MarkerWidgetState();
}

class _MarkerWidgetState extends State<MarkerWidget> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        // Your marker design
        child: Text(widget.text),
      ),
    );
  }
}
