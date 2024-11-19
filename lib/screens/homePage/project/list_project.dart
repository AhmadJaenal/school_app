import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_popup_message.dart';
import '../../../models/project.dart';
import '../../../services/project/project.dart';
import '../../../shared/theme.dart';

import '../../../widgets/card_project.dart';

class ListProject extends StatelessWidget {
  const ListProject({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectProvider projectProvider = Provider.of<ProjectProvider>(context);
    UserPreferences userPrefs = UserPreferences();

    var loading = const Center(child: CircularProgressIndicator());

    deleteProject() async {
      final Future<Map<String, dynamic>> successfulMessage =
          projectProvider.deleteProjectById();

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
          'Daftar Proyek',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        child: FutureBuilder(
          future: userPrefs.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User userData = snapshot.data!;
              return FutureBuilder(
                future: userData.roles!.contains('intern')
                    ? projectProvider.getProjectByAssigment()
                    : projectProvider.getAllProject(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text(
                      'Belum ada project yang bisa ditugaskan',
                      style: AppTextStyle.paragraphL,
                    ));
                  }
                  List<Project> project = snapshot.data!['data'];
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: project.length,
                    itemBuilder: (context, index) => CardProject(
                        project: project[index],
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
                                        'Hapus Proyek',
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
                                          projectProvider.projectStatus ==
                                                  ProcessState.delete
                                              ? loading
                                              : SizedBox(
                                                  width: 130,
                                                  child: PrimaryButton(
                                                    titleButton: 'Ya',
                                                    ontap: () {
                                                      deleteProject();
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
            return const SizedBox();
          },
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
          successMessage: 'Proyek berhasil dihapus!',
          failedMessage: 'Proyek gagal dihapus!'),
    );
  }
}
