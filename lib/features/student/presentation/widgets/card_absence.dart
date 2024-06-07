import 'package:flutter/cupertino.dart';

import '../../../../core/style/style.dart';

class CardAbsence extends StatelessWidget {
  final String title;
  final int amount;
  final Color color;
  const CardAbsence({
    super.key,
    required this.width,
    required this.title,
    required this.amount,
    required this.color,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .43,
      height: 94,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(.1),
        border: Border.all(
          width: 1,
          color: color.withOpacity(.8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.paragraphLBold.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            amount.toString(),
            style: AppTextStyle.h3.copyWith(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
