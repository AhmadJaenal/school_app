import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/project_assignment.dart';
import 'package:school_app/services/project/assignment.dart';
import 'package:school_app/widgets/card_assignment.dart';
import 'package:school_app/widgets/custom_popup_message.dart';
import '../../../shared/theme.dart';

class AssignmentProject extends StatelessWidget {
  const AssignmentProject({super.key});

  @override
  Widget build(BuildContext context) {
    AssignmentProvider assignmentProvider =
        Provider.of<AssignmentProvider>(context);
    UserPreferences userPrefs = UserPreferences();

    var loading = const Center(child: CircularProgressIndicator());

    // getProject() async {
    //   final Future<Map<String, dynamic>> successfulMessage =
    //       assignmentProvider.getAllAssignment();

    //   successfulMessage.then((response) {
    //     if (response['status']) {
    //       popUpSubmission(context, true);
    //     } else {
    //       popUpSubmission(context, false);
    //     }
    //   });
    // }

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
          'Daftar Penugasan',
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
              return FutureBuilder(
                future: assignmentProvider.getAllAssignment(),
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
                  List<ProjectAssignment> assignment = snapshot.data!['data'];
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: assignment.length,
                    itemBuilder: (context, index) {
                      return CardAssignment(
                        assignment: assignment[index],
                      );
                    },
                  );
                },
              );
            }
            return const SizedBox();
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
          Get.toNamed('/add-assignment');
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
          successMessage: 'Proyek berhasil dihapus!',
          failedMessage: 'Proyek gagal dihapus!'),
    );
  }
}
