import 'package:flutter/material.dart';
import 'package:inva_lawmax/core/resources/app_text.dart';
import '../utils/responsive.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({
    super.key,
    this.hintText = "",
    this.labelText = "",
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.width(context, 1.2),
        vertical: Responsive.height(context, 0.8),
      ),
      child: TextFormField(
        controller: controller,
        style: AppTextTheme.textTheme.labelLarge?.copyWith(color: Colors.grey),
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: Responsive.contentPadding(context),
          hintText: hintText,
          labelText: labelText,
          labelStyle:
              AppTextTheme.textTheme.labelLarge?.copyWith(color: Colors.grey),
          hintStyle:
              AppTextTheme.textTheme.labelLarge?.copyWith(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
