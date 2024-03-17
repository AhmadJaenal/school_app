import 'package:flutter/material.dart';
import 'package:school_app/shared/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        style: AppTextStyle.paragraphL
            .copyWith(color: AppColors.black, fontWeight: AppWeightFont.bold),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary1, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: AppTextStyle.paragraphL.copyWith(
            color: AppColors.black80,
            fontWeight: AppWeightFont.bold,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldPassword extends StatefulWidget {
  const CustomTextFieldPassword({super.key});

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: TextField(
        obscureText: _showPassword ? true : false,
        textAlignVertical: TextAlignVertical.bottom,
        style: AppTextStyle.paragraphL
            .copyWith(color: AppColors.black, fontWeight: AppWeightFont.bold),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                _showPassword
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye_outlined,
                color:
                    _showPassword ? AppColors.black80 : AppColors.secondary1),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary1, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: "Password",
          hintStyle: AppTextStyle.paragraphL.copyWith(
            color: AppColors.black80,
            fontWeight: AppWeightFont.bold,
          ),
        ),
      ),
    );
  }
}
