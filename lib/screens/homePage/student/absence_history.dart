import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/presence.dart';
import 'package:school_app/services/presence_service.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/card_absence.dart';
import 'package:school_app/widgets/card_activity.dart';
import 'package:school_app/widgets/custom_button.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

    PresenceProvider presenceProvider = Provider.of<PresenceProvider>(context);

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
            FutureBuilder(
              future: UserPreferences().getPresence(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    CountPresence countPresence = snapshot.data!;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardAbsence(
                              width: width,
                              title: 'Jumlah Hadir',
                              color: AppColors.green,
                              amount: countPresence.present!,
                            ),
                            CardAbsence(
                              width: width,
                              title: 'Jumlah Izin',
                              color: AppColors.info1,
                              amount: countPresence.permission!,
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
                              color: AppColors.warning1,
                              amount: countPresence.sick!,
                            ),
                            CardAbsence(
                              width: width,
                              title: 'Jumlah Alpa',
                              color: AppColors.danger1,
                              amount: countPresence.absent ?? 0,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Text('Loading');
                  }
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Gap(16),
            Text(
              'Tracking Pengerjaan Tugas',
              style:
                  AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
            ),
            const Gap(8),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: FutureBuilder(
                future: presenceProvider.getPresenceByUserId(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<Presence> presence = snapshot.data!['data'];
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 10,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 1,
                        ),
                        itemCount: presence.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                builder: (context) => Container(
                                  width: double.infinity,
                                  height: 165,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 22),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: AppMargin.defaultMargin,
                                    vertical: 28,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hari Ke-${index + 1} Anda Magang',
                                        style: AppTextStyle.h3.copyWith(
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      const Gap(4),
                                      Text(
                                        'Absensi: ${presence[index].status}',
                                        style: AppTextStyle.paragraphL.copyWith(
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      const Gap(8),
                                      PrimaryButton(
                                        titleButton: 'Tugas yang dikerjakan',
                                        ontap: () {},
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
                                color: presence[index].status == 'Hadir'
                                    ? AppColors.green
                                    : presence[index].status == 'Sakit'
                                        ? AppColors.warning2
                                        : presence[index].status == 'Izin'
                                            ? AppColors.info1
                                            : AppColors.danger2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: AppTextStyle.paragraphS
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('Terjadi Kesalahan'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            // SfDateRangePicker(
            //   headerStyle: DateRangePickerHeaderStyle(
            //     backgroundColor: AppColors.white,
            //     textAlign: TextAlign.center,
            //     textStyle: AppTextStyle.paragraphMBold.copyWith(
            //       color: AppColors.black,
            //     ),
            //   ),
            //   selectionShape: DateRangePickerSelectionShape.circle,
            //   selectionColor: AppColors.blue,
            //   backgroundColor: AppColors.white,
            //   selectionMode: DateRangePickerSelectionMode.multiRange,
            //   initialSelectedDates: selectedDays,
            //   showNavigationArrow: true,
            //   monthCellStyle: DateRangePickerMonthCellStyle(
            //     textStyle: AppTextStyle.paragraphMBold.copyWith(
            //       color: AppColors.black,
            //     ),
            //     weekendTextStyle: AppTextStyle.paragraphMBold.copyWith(
            //       color: AppColors.primary1,
            //     ),
            //   ),
            // ),

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
            const Gap(8),
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
