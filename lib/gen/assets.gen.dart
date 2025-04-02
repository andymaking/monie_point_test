/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/logo_png.png
  AssetGenImage get logoPng => const AssetGenImage('assets/png/logo_png.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoPng];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bin-svgrepo-com.svg
  String get binSvgrepoCom => 'assets/svg/bin-svgrepo-com.svg';

  /// File path: assets/svg/building-svgrepo-com.svg
  String get buildingSvgrepoCom => 'assets/svg/building-svgrepo-com.svg';

  /// File path: assets/svg/filter-rectangle-svgrepo-com.svg
  String get filterRectangleSvgrepoCom =>
      'assets/svg/filter-rectangle-svgrepo-com.svg';

  /// File path: assets/svg/heart-svgrepo-com.svg
  String get heartSvgrepoCom => 'assets/svg/heart-svgrepo-com.svg';

  /// File path: assets/svg/home-svgrepo-com.svg
  String get homeSvgrepoCom => 'assets/svg/home-svgrepo-com.svg';

  /// File path: assets/svg/layer-svgrepo-com.svg
  String get layerSvgrepoCom => 'assets/svg/layer-svgrepo-com.svg';

  /// File path: assets/svg/list-svgrepo-com.svg
  String get listSvgrepoCom => 'assets/svg/list-svgrepo-com.svg';

  /// File path: assets/svg/location-svgrepo-com.svg
  String get locationSvgrepoCom => 'assets/svg/location-svgrepo-com.svg';

  /// File path: assets/svg/message-svgrepo-com.svg
  String get messageSvgrepoCom => 'assets/svg/message-svgrepo-com.svg';

  /// File path: assets/svg/search-svgrepo-com.svg
  String get searchSvgrepoCom => 'assets/svg/search-svgrepo-com.svg';

  /// File path: assets/svg/send-svgrepo-com.svg
  String get sendSvgrepoCom => 'assets/svg/send-svgrepo-com.svg';

  /// File path: assets/svg/shield-check-svgrepo-com.svg
  String get shieldCheckSvgrepoCom => 'assets/svg/shield-check-svgrepo-com.svg';

  /// File path: assets/svg/user-svgrepo-com.svg
  String get userSvgrepoCom => 'assets/svg/user-svgrepo-com.svg';

  /// File path: assets/svg/wallet-money-cash-svgrepo-com.svg
  String get walletMoneyCashSvgrepoCom =>
      'assets/svg/wallet-money-cash-svgrepo-com.svg';

  /// File path: assets/svg/wallet-outline-svgrepo-com.svg
  String get walletOutlineSvgrepoCom =>
      'assets/svg/wallet-outline-svgrepo-com.svg';

  /// List of all assets
  List<String> get values => [
    binSvgrepoCom,
    buildingSvgrepoCom,
    filterRectangleSvgrepoCom,
    heartSvgrepoCom,
    homeSvgrepoCom,
    layerSvgrepoCom,
    listSvgrepoCom,
    locationSvgrepoCom,
    messageSvgrepoCom,
    searchSvgrepoCom,
    sendSvgrepoCom,
    shieldCheckSvgrepoCom,
    userSvgrepoCom,
    walletMoneyCashSvgrepoCom,
    walletOutlineSvgrepoCom,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
