import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
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
    this.maxLines = 1,
    this.inputFormatters,
    this.hint,
    this.isDense,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.filled,
    this.fillColor = AppColors.textFieldFillColor,
    this.onchanged,
    this.isSearchField = false,
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
  final bool? isDense;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool? filled;
  final Color? fillColor;
  final Function(String)? onchanged;
  final bool isSearchField;

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
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyle.hintTextStyle,
        isDense: isDense,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffix: suffix,
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(isSearchField ? 30 : 5)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(isSearchField ? 30 : 5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(isSearchField ? 30 : 5)),
      ),
    );
  }
}
