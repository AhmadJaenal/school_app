import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/models/presence.dart';
import 'package:school_app/services/presence_service.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        border: Border.all(width: 1, color: color.withOpacity(.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
          ),
          Text(
            amount.toString(),
            style: AppTextStyle.h3.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class UserAbsenceGrid extends StatelessWidget {
  final List<Presence> listPresence;
  const UserAbsenceGrid({super.key, required this.listPresence});

  saveDate(date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateTask', date);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1,
      ),
      itemCount: listPresence.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              elevation: 0,
              builder: (context) => Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 22,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.defaultMargin,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hari Ke-${index + 1} Magang',
                      style: AppTextStyle.h3.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'Absensi: ${listPresence[index].status}',
                      style: AppTextStyle.paragraphL.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'Tempat Kerja: ${listPresence[index].type}',
                      style: AppTextStyle.paragraphL.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const Gap(8),
                    PrimaryButton(
                      titleButton: 'Tugas yang dikerjakan',
                      ontap: () {
                        saveDate(listPresence[index].createdAt);
                        context.push('/task-history');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: getPresenceColor(listPresence[index].status!),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '${listPresence[index].id}',
                style: AppTextStyle.paragraphS.copyWith(color: AppColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
