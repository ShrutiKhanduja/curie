import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:curie_money/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {Key? key,
      required this.hintText,
      this.helperText,
      this.suffixIconWidget,
      this.prefixIconWidget,
      this.textEditingController,
      this.focusNode,
      this.autoFocus = false,
      this.isEnabled = true,
      this.keyboardType,
      this.prefixText,
      this.onChangedFunction,
      this.textCapitalization = TextCapitalization.sentences,
      this.maxLength,
      this.counterWidget = const Offstage(),
      this.initialValue,
      this.maxLines = 1,
      this.obscureText = false,
      this.onSubmitted,
      this.radius = 10,
      this.inputFormatters,
      this.fieldLabelStyle})
      : super(key: key);

  final String hintText;
  final String? prefixText;
  final String? helperText;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool autoFocus;
  final String? Function(String?)? onSubmitted;
  final String? Function(String?)? onChangedFunction;

  final TextInputType? keyboardType;
  final bool isEnabled;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final Widget? counterWidget;
  final String? initialValue;
  final int? maxLines;
  final bool obscureText;
  final double radius;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? fieldLabelStyle;

  @override
  Widget build(BuildContext context) {
    return AutoSizeTextField(
      onSubmitted: onSubmitted,
        minLines: 1,
        fullwidth: false,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enabled: isEnabled,
        maxLines: maxLines,
        textCapitalization: textCapitalization,
        controller: textEditingController,
        focusNode: focusNode,
        autofocus: autoFocus,
        onChanged: onChangedFunction,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.workSans(color: AppColors.onPrimary, fontSize: 70),
        cursorColor: Colors.grey,
        inputFormatters: inputFormatters,
        decoration: primaryTextFieldInputDecoration(
          helperText: helperText,
          hintText: hintText,
          prefixIconWidget: prefixIconWidget,
          suffixIconWidget: suffixIconWidget,
          prefixText: prefixText,
          context: context,
        ).copyWith(
          counter: counterWidget,
        ));
  }
}

InputDecoration primaryTextFieldInputDecoration({
  String? helperText,
  Widget? prefixIconWidget,
  String? hintText,
  String? prefixText,
  Widget? suffixIconWidget,
  double leftPadding = 20.0,
  double radius = 10,
  required BuildContext context,
}) {
  return InputDecoration(
    helperText: helperText,
    prefixIcon: prefixIconWidget,
    prefixText: prefixText,
    suffixIcon: suffixIconWidget,
    prefixStyle: GoogleFonts.workSans(),
    helperStyle: Theme.of(context).textTheme.caption,
    hintText: hintText,
    hintStyle: GoogleFonts.workSans(
        color: AppColors.onPrimary.withOpacity(0.4), fontSize: 70),
    isDense: true,
    isCollapsed: true,
    contentPadding: EdgeInsets.only(
      left: leftPadding,
      top: 17,
      bottom: 17,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: AppColors.primaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: AppColors.primaryColor)),
  );
}
