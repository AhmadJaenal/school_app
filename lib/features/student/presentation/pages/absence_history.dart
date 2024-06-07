import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../core/style/style.dart';
import '../widgets/card_activity.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../widgets/card_absence.dart';

// ignore: must_be_immutable
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
    // double height = MediaQuery.of(context).size.height;
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
                  onTap: () => Get.toNamed('/activity-student'),
                  child: Text(
                    'Lihat Semua',
                    style: AppTextStyle.paragraphM
                        .copyWith(color: AppColors.primary1),
                  ),
                )
              ],
            ),
            const Gap(15),
            const CardActivity(),
            const CardActivity(),
            const CardActivity(),
            const CardActivity(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
