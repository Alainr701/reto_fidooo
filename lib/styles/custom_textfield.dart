import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reto/styles/f_text.dart';

class FTextField extends StatelessWidget {
  const FTextField({
    Key? key,
    required this.controller,
    this.selectedColor,
    this.textInputType = TextInputType.text,
    this.inputFormatters = const [],
    this.withTitle = true,
    this.editable,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.prefixIcon,
    this.textAlign = TextAlign.end,
    this.hintText,
    this.focusNode,
    this.onEditingComplete,
    this.onTap,
    this.onSubmitted,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.borderRadius = 5,
    this.obscureText = false,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
    this.hintStyle = const TextStyle(overflow: TextOverflow.ellipsis),
    this.autofillHints,
    this.titleStyle = const TextStyle(overflow: TextOverflow.ellipsis),
    this.textStyle = const TextStyle(overflow: TextOverflow.ellipsis),
    this.fillColor = Colors.white70,
    this.enabledBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Color(0xFF646464), width: 0.5)),
    this.readOnly = false,
    this.inputDecoration,
    this.validator,
    this.title,
  }) : super(key: key);
  final bool withTitle;
  final String? title;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final Color? selectedColor;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final bool? editable;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;
  final IconData? prefixIcon;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? minLines;
  final void Function()? onEditingComplete;
  final Widget? suffixIcon;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final Color fillColor;
  final InputBorder? enabledBorder;
  final bool readOnly;
  final InputDecoration? inputDecoration;

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FText(hintText ?? '', style: titleStyle),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          onFieldSubmitted: onSubmitted,
          decoration: inputDecoration ??
              InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: selectedColor == null
                      ? const BorderSide()
                      : BorderSide(color: selectedColor!),
                ),
                enabledBorder: enabledBorder,
                contentPadding: contentPadding,
                filled: true,
                hintText: hintText,
                hintStyle: hintStyle,
                fillColor: fillColor,
                prefixIcon: prefixIcon != null
                    ? Icon(prefixIcon, color: selectedColor)
                    : null,
                suffixIcon: suffixIcon,
                isDense: true,
              ),
        ),
      ],
    );
  }
}
