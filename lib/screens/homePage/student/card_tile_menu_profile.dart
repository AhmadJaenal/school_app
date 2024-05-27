import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class TileMenuProfile extends StatelessWidget {
  final String icon;
  final String title;
  const TileMenuProfile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Image.asset('assets/$icon', width: 24),
          const Gap(16),
          Text(
            title,
            style: AppTextStyle.paragraphLBold.copyWith(
              color: AppColors.black100,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.black80,
          ),
        ],
      ),
    );
  }
}
