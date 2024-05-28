import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class TransactionWidget extends StatelessWidget {
  final bool isCashIn;
  final String titleTransaction;
  final String date;
  final String amount;
  const TransactionWidget({
    super.key,
    this.isCashIn = true,
    required this.titleTransaction,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.blue.withOpacity(.2),
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: AppColors.blue,
            ),
          ),
          const Gap(6),
          RichText(
            text: TextSpan(
              style:
                  AppTextStyle.paragraphMBold.copyWith(color: AppColors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '$titleTransaction\n',
                ),
                TextSpan(
                  text: date,
                  style: AppTextStyle.paragraphXS
                      .copyWith(color: AppColors.black80),
                ),
              ],
            ),
          ),
          const Spacer(),
          isCashIn
              ? Text(
                  '+Rp$amount',
                  style: AppTextStyle.h3.copyWith(
                    color: AppColors.green,
                  ),
                )
              : Text(
                  '-Rp$amount',
                  style: AppTextStyle.h3.copyWith(
                    color: AppColors.primary1,
                  ),
                ),
        ],
      ),
    );
  }
}

class CardNominal extends StatelessWidget {
  final String amount;
  final Function() onPressed;
  const CardNominal({super.key, required this.amount, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.black40,
        minimumSize: Size(width * .4, 55),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        'Rp$amount',
        style: AppTextStyle.h3.copyWith(
          color: AppColors.primary1,
        ),
      ),
    );
  }
}
