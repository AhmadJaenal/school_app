import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class AbsenceHistory extends StatelessWidget {
  AbsenceHistory({super.key});

  List<DateTime> selectedDays = [
    DateTime(2024, 3, 12),
    DateTime(2024, 3, 15),
    DateTime(2024, 3, 17),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Riwayat Absensi',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: ListView(
          children: [
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardAbsence(
                  width: width,
                  title: 'Jumlah Izin',
                  color: AppColors.info1,
                  amount: 0,
                ),
                CardAbsence(
                  width: width,
                  title: 'Jumlah Hadir',
                  color: AppColors.green,
                  amount: 3,
                ),
              ],
            ),
            const Gap(14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardAbsence(
                  width: width,
                  title: 'Jumlah Sakit',
                  color: AppColors.secondary1,
                  amount: 1,
                ),
                CardAbsence(
                  width: width,
                  title: 'Jumlah Alpa',
                  color: AppColors.danger2,
                  amount: 1,
                ),
              ],
            ),
            const Gap(16),
            SfDateRangePicker(
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: AppColors.white,
                textAlign: TextAlign.center,
                textStyle: AppTextStyle.paragraphMBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              selectionShape: DateRangePickerSelectionShape.circle,
              selectionColor: AppColors.blue,
              backgroundColor: AppColors.white,
              selectionMode: DateRangePickerSelectionMode.multiRange,
              initialSelectedDates: selectedDays,
              showNavigationArrow: true,
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: AppTextStyle.paragraphMBold.copyWith(
                  color: AppColors.black,
                ),
                weekendTextStyle: AppTextStyle.paragraphMBold.copyWith(
                  color: AppColors.primary1,
                ),
              ),
            ),

            // TableCalendar(
            //   firstDay: DateTime.utc(2010, 10, 16),
            //   lastDay: DateTime.utc(2030, 3, 14),
            //   focusedDay: DateTime.now(),
            //   selectedDayPredicate: (day) {
            //     return DateFormat.yMd().format(day) ==
            //         DateFormat.yMd().format(_selectedDay);
            //   },
            //   calendarStyle: CalendarStyle(
            //     weekendTextStyle:
            //         AppTextStyle.paragraphM.copyWith(color: AppColors.primary1),
            //     selectedDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: Colors.blue,
            //     ),
            //   ),
            //   daysOfWeekStyle: DaysOfWeekStyle(
            //     weekdayStyle:
            //         AppTextStyle.paragraphM.copyWith(color: AppColors.black),
            //     weekendStyle:
            //         AppTextStyle.paragraphM.copyWith(color: AppColors.primary1),
            //   ),
            //   headerStyle: HeaderStyle(
            //     titleCentered: true,
            //     formatButtonVisible: false,
            //     titleTextStyle: AppTextStyle.paragraphMBold.copyWith(
            //       color: AppColors.black,
            //     ),
            //   ),
            // )
            const Gap(19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktivitas', style: AppTextStyle.paragraphLBold),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Lihat Semua',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                )
              ],
            ),
            const Gap(15),
            CardActivity(),
            CardActivity(),
            CardActivity(),
            CardActivity(),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Padding CardActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.info1.withOpacity(.1),
            ),
            child: Image.asset(
              'assets/icon_login.png',
            ),
          ),
          const Gap(16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Masuk\n',
                  style: AppTextStyle.paragraphLBold
                      .copyWith(color: AppColors.black),
                ),
                TextSpan(
                  text: '23 Agustus 2023',
                  style: AppTextStyle.paragraphM
                      .copyWith(color: AppColors.black80),
                ),
              ],
            ),
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '07:01\n',
                  style: AppTextStyle.paragraphLBold
                      .copyWith(color: AppColors.black),
                ),
                TextSpan(
                  text: 'Tepat Waktu',
                  style: AppTextStyle.paragraphM
                      .copyWith(color: AppColors.black80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
