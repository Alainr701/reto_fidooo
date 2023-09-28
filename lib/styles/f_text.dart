import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class FText extends StatelessWidget {
  const FText(
    this.text, {
    super.key,
    this.style = const TextStyle(),
    this.textAlign,
    this.color = Colors.black,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.newLineAsBreaks = true,
    this.textDirection,
    this.textScaleFactor,
    this.softWrap = true,
    this.onTap,
  });

  final String text;
  final TextAlign? textAlign;
  final Color color;
  final TextOverflow overflow;
  final TextStyle style;
  final int? maxLines;
  final bool newLineAsBreaks;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final bool softWrap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: StyledText(
        text: text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        newLineAsBreaks: newLineAsBreaks,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        softWrap: softWrap,
        style: style,
        tags: {
          'b':
              StyledTextTag(style: style.copyWith(fontWeight: FontWeight.bold)),
          'i':
              StyledTextTag(style: style.copyWith(fontStyle: FontStyle.italic)),
        },
      ),
    );
  }
}
