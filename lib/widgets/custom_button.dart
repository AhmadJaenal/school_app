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

class PrimaryButtonWithIcon extends StatelessWidget {
  final String titleButton;
  final Icon icon;
  final Function() ontap;
  const PrimaryButtonWithIcon(
      {super.key,
      required this.titleButton,
      required this.ontap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary1,
        padding: const EdgeInsets.symmetric(vertical: 12),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: icon,
      label: Text(
        titleButton,
        style: AppTextStyle.paragraphLBold.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
