import 'package:flutter/material.dart';

class FButtonContainer extends StatelessWidget {
  const FButtonContainer(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.child,
      this.border,
      this.borderRadius = 15.0,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      this.margin,
      this.textAlign,
      this.onTap})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final Border? border;
  final double borderRadius;
  final AlignmentGeometry? textAlign;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        alignment: textAlign,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            border: border,
            color: color),
        child: child,
      ),
    );
  }
}
