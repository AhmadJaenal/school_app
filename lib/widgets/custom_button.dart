import 'package:flutter/material.dart';
import 'package:school_app/shared/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String titleButton;
  final Function() ontap;
  const PrimaryButton(
      {super.key, required this.titleButton, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary1,
        padding: const EdgeInsets.symmetric(vertical: 12),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        titleButton,
        style: AppTextStyle.h3.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
