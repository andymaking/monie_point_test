import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import '../gen/assets.gen.dart';
import '../utils/constants.dart';
import '/utils/widget_extensions.dart';
import 'apptexts.dart';
import 'svg_builder.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final String? hint;
  final String? labelText;
  final bool readonly;
  final double? percentage;
  final bool useBorder;
  final bool isPassword;
  final bool showError;
  final Widget? suffixIcon;
  final Widget? errorWidget;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? label;
  final Widget? prefix;
  final Widget? prefixIcon;
  final double? textSize;
  final double? borderRadius;
  final TextAlign textAlign ;
  final Color? hintColor;
  final Color? bodyTextColor;
  final Color? fillColor;
  final Color? textColor;
  final bool? enabled;
  final bool? overrideIconColor;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;
  final InputBorder? enabledBorder;
  final int? maxLength;
  final int? maxHeight;
  final bool? haveText;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const AppTextField(
      {super.key,
        this.readonly = false,
        this.useBorder = true,
        this.isPassword = false,
        this.showError = true,
        this.percentage,
        this.hintText,
        this.hint,
        this.onChanged,
        this.controller,
        this.keyboardType = TextInputType.text,
        this.textAlign = TextAlign.start,
        this.onTap,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.validator,
        this.autofillHints,
        this.suffixIcon,
        this.textSize,
        this.haveText,
        this.maxLength,
        this.labelText,
        this.label,
        this.contentPadding,
        this.prefix,
        this.maxHeight = 1,
        this.hintColor,
        this.textColor,
        this.inputFormatters,
        this.errorWidget,
        this.enabled,
        this.fillColor,
        this.overrideIconColor,
        this.enabledBorder,
        this.autoValidateMode,
        this.borderRadius,
        this.bodyTextColor,
        this.textInputAction, this.prefixIcon
      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isVisible = false;


  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool isDark = isAppDark(context);
    double percentage = widget.percentage ?? 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hintText != null
            ? Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppText(
                    widget.hintText ?? "",
                    size: widget.textSize ?? 16.sp,
                    align: TextAlign.start,
                    weight: FontWeight.w500,
                    color: widget.hintColor?? stateColor12(isAppDark(context)),
                  ),
                ),
                if(widget.percentage!=null)...[
                  ClipRRect(
                    borderRadius:BorderRadius.circular(4.r),
                    child: Container(
                      width: 80.sp,
                      height: 6.sp,
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 6.sp,
                            width: 80.sp * (widget.percentage??0)/100,
                            color: widget.percentage == null || percentage < 50? Colors.red : percentage==50 || percentage < 75? amber7(isDark): green8(isDark),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ],
            ),
            10.0.sbH,
          ],
        )
            : 0.0.sbH,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                textAlign: widget.textAlign,
                validator: widget.validator,
                autofillHints: widget.autofillHints,
                onEditingComplete: widget.onEditingComplete,
                autovalidateMode: widget.autoValidateMode,
                onFieldSubmitted: widget.onFieldSubmitted,
                maxLines: widget.maxHeight,
                focusNode: _focusNode,
                maxLength: widget.maxLength,
                onChanged: (val) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(val);
                  }
                },
                onTap: widget.onTap,
                readOnly: widget.readonly,
                enabled: widget.enabled,
                obscureText: widget.isPassword ? !isVisible : false,
                textInputAction: widget.textInputAction?? TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp, fontFamily: 'Inter', color: widget.bodyTextColor),
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                    errorMaxLines: 3,
                    counter: 0.0.sbH,
                    hintText: widget.hint,
                    fillColor: widget.fillColor,
                    enabled: widget.enabled ?? true,
                    error: widget.errorWidget,
                    prefixIconColor: widget.overrideIconColor ==true? null: const Color(0xFF2A2A2A),
                    suffixIconColor: widget.overrideIconColor ==true? null: const Color(0xFF2A2A2A),
                    prefixIcon: widget.prefixIcon?? (widget.prefix==null? null : SizedBox(height: 30.sp, width: 30.sp ,child: Align(alignment: Alignment.center, child: widget.prefix))),
                    suffixIcon: widget.suffixIcon ?? (widget.isPassword
                        ? InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Padding(
                        padding: 16.sp.padR,
                        child: widget.suffixIcon ??
                            Icon(isVisible
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill, size: 20.sp,
                            ),
                      ),
                    )
                        : widget.suffixIcon
                    ),
                    suffixIconConstraints: BoxConstraints(maxHeight: 25.sp, maxWidth: 40.sp),
                    prefixIconConstraints: BoxConstraints(maxHeight: 25.sp, maxWidth: 40.sp),
                    enabledBorder: !widget.useBorder? InputBorder.none : null,
                    errorBorder: !widget.useBorder? InputBorder.none : null,
                    focusedErrorBorder: !widget.useBorder? InputBorder.none : null,
                    focusedBorder: !widget.useBorder? InputBorder.none : null,
                    disabledBorder: !widget.useBorder? InputBorder.none : null,
                    border: !widget.useBorder? InputBorder.none : null,
                    label: widget.label,
                    labelText: widget.labelText,
                    contentPadding: widget.contentPadding,
                  errorStyle: Theme.of(context).inputDecorationTheme.errorStyle?.copyWith(
                    fontSize: !widget.showError? 0.sp: null,

                  )
                ),
                keyboardType: widget.keyboardType,
              ),
            ),
          ],
        ),
      ],
    );
  }
}