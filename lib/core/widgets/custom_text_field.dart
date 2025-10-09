
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.validator, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.style13Regular(
            context,
          ).copyWith(color: AppColors.grey9EColor),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged:onChanged ,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.style13Regular(
              context,
            ).copyWith(color: AppColors.grey9EColor),
            suffixIcon: suffixIcon,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey9EColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey9EColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.purpleColor),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor),
            ),
            errorStyle: AppTextStyles.style13Regular(
              context,
            ).copyWith(color: AppColors.redColor),
          ),
        ),
      ],
    );
  }
}