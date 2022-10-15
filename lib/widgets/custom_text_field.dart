import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.style,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.maxLines,
    this.inputFormatters,
    this.hint,
    this.hintStyle,
    this.isDense,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.filled,
    this.fillColor,
    this.border,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? hint;
  final TextStyle? hintStyle;
  final bool? isDense;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: style,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        isDense: isDense,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffix: suffix,
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor: fillColor,
        border: border,
      ),
    );
  }
}
