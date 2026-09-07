import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/school.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/school/school_service.dart';
import 'package:school_app/widgets/card_school.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_popup_message.dart';
import '../../../shared/theme.dart';

class ListSchool extends StatelessWidget {
  const ListSchool({super.key});

  @override
  Widget build(BuildContext context) {
    SchoolProvider schoolProvider = Provider.of<SchoolProvider>(context);
    UserPreferences userPrefs = UserPreferences();

    var loading = const Center(child: CircularProgressIndicator());

    deleteSchool() async {
      final Future<Map<String, dynamic>> successfulMessage =
          schoolProvider.deleteSchoolById();

      successfulMessage.then((response) {
        if (response['status']) {
          popUpSubmission(context, true);
        } else {
          popUpSubmission(context, false);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black100,
          ),
        ),
        title: Text(
          'Daftar Sekolah',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: FutureBuilder(
          future: userPrefs.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User userData = snapshot.data!;
              return FutureBuilder(
                future: schoolProvider.getAllSchool(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'Tidak ada sekolah yang\nmelakukan magang saat ini',
                        style: AppTextStyle.paragraphL,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  List<SchoolModel> schools = snapshot.data!['data'];
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: schools.length,
                    itemBuilder: (context, index) => CardSchool(
                        school: schools[index],
                        onLongPress: () => userData.roles!.contains('staff')
                            ? showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                builder: (context) => Container(
                                  width: double.infinity,
                                  height: 185,
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
                                        'Hapus data sekolah ini?',
                                        style: AppTextStyle.h3.copyWith(
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      const Gap(8),
                                      Text(
                                        'Apakah Anda yakin ingin hapus proyek ini?',
                                        style: AppTextStyle.paragraphL.copyWith(
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      const Gap(8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: SecondaryButton(
                                                titleButton: 'Batal',
                                                ontap: () => Get.back()),
                                          ),
                                          schoolProvider.schoolStatus ==
                                                  ProcessState.delete
                                              ? loading
                                              : SizedBox(
                                                  width: 130,
                                                  child: PrimaryButton(
                                                    titleButton: 'Ya',
                                                    ontap: () {
                                                      deleteSchool();
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : {}),
                  );
                },
              );
            }
            return Center(
              child: Text(
                'Tidak ada sekolah yang\nmelakukan magang saat ini',
                style: AppTextStyle.paragraphL,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary1,
          minimumSize: const Size(62, 62),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        onPressed: () {
          Get.toNamed('/add-school');
        },
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 32,
          weight: 2,
        ),
      ),
    );
  }

  Future<dynamic> popUpSubmission(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Data sekolah berhasil dihapus!',
          failedMessage: 'Data sekolah gagal dihapus!'),
    );
  }
}
