import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class PopUpMessage extends StatelessWidget {
  final bool isSuccess;
  final String successMessage;
  final String failedMessage;
  const PopUpMessage(
      {super.key,
      required this.isSuccess,
      required this.successMessage,
      required this.failedMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      margin: EdgeInsets.symmetric(
        horizontal: AppMargin.defaultMargin,
        vertical: 28,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isSuccess ? successMessage : failedMessage,
            style: AppTextStyle.h3.copyWith(
              color: AppColors.darkBlue,
            ),
            maxLines: 2,
          ),
          const Gap(8),
          Icon(
              isSuccess
                  ? Icons.check_circle_outline_outlined
                  : Icons.cancel_outlined,
              color: isSuccess ? AppColors.info1 : AppColors.primary1,
              size: 64)
        ],
      ),
    );
  }
}
