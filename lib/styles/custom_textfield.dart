import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FTextField extends StatelessWidget {
  const FTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.selectedColor,
      this.textinputType = TextInputType.text,
      this.inputFormatters = const [],
      this.withTitle = true,
      this.editable = true,
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
      this.borderRadius = 10,
      this.obscureText = false,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      this.autofillHints,
      this.titleStyle = const TextStyle(overflow: TextOverflow.ellipsis),
      this.textStyle = const TextStyle(overflow: TextOverflow.ellipsis),
      this.hintStyle = const TextStyle(overflow: TextOverflow.ellipsis),
      this.fillColor = Colors.white70,
      this.enabledBorder = const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF646464), width: 0.5))})
      : super(key: key);
  final String title;
  final bool withTitle;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final Color? selectedColor;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final bool editable;
  final TextInputType textinputType;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
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

  @override
  Widget build(BuildContext context) {
    if (!withTitle) {
      return _createTextField();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 5),
            child: Text(title, style: titleStyle)),
        const SizedBox(height: 2),
        _createTextField()
      ],
    );
  }

  Widget _createTextField() {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      controller: controller,
      keyboardType: textinputType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      autofillHints: autofillHints,
      enabled: editable,
      obscureText: obscureText,
      cursorColor: selectedColor,
      style: textStyle,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: selectedColor == null
              ? const BorderSide()
              : BorderSide(color: selectedColor!),
        ),
        enabledBorder: enabledBorder,
        contentPadding: contentPadding,
        hintText: hintText ?? title,
        // filled: true,
        hintStyle: hintStyle,
        fillColor: fillColor,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: selectedColor) : null,
        suffixIcon: suffixIcon,
        isDense: true,
      ),
    );
  }
}
