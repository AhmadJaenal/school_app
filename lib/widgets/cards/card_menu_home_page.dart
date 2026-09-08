import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_text_styles.dart';

class CardMenu extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String titleButton;
  final String desc;
  const CardMenu({
    super.key,
    required this.onTap,
    required this.title,
    required this.titleButton,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .44,
      height: 174,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.primary1.withOpacity(.7),
            BlendMode.srcATop,
          ),
          image: const AssetImage('assets/spp_pattern.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.h3.copyWith(color: AppColors.white)),
          const Gap(2),
          Text(
            desc,
            style: AppTextStyle.paragraphS.copyWith(color: AppColors.white),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(160, 34),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              titleButton,
              style: AppTextStyle.paragraphLBold.copyWith(
                color: AppColors.secondary1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
