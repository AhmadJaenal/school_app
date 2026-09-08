import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/student/student_service.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListChildren extends StatelessWidget {
  const ListChildren({super.key});

  @override
  Widget build(BuildContext context) {
    StudentProvider studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Daftar Siswa',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: studentProvider.getAllStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text(snapshot.error.toString()));
          }

          List<User> listInternship = snapshot.data!['data'];
          return ListView.builder(
            itemCount: listInternship.length,
            itemBuilder: (context, index) => cardDataChildren(
              context: context,
              user: listInternship[index],
              onLongPress: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                elevation: 0,
                builder: (context) => Container(
                  width: double.infinity,
                  height: 185,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 130,
                            child: SecondaryButton(
                              titleButton: 'Batal',
                              ontap: () => context.pop(),
                            ),
                          ),
                          // projectProvider.projectStatus ==
                          //         ProjectStatus.delete
                          //     ? loading
                          //     : SizedBox(
                          //         width: 130,
                          //         child: PrimaryButton(
                          //           titleButton: 'Ya',
                          //           ontap: () {
                          //             deleteProject();
                          //           },
                          //         ),
                          //       ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
          context.push(Routes.addChildren);
        },
        child: Icon(Icons.add, color: AppColors.white, size: 32, weight: 2),
      ),
    );
  }

  saveIntenshipId(idInternship) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('internshipId', idInternship);
  }

  GestureDetector cardDataChildren({
    required BuildContext context,
    required User user,
    Function()? onLongPress,
  }) {
    return GestureDetector(
      onTap: () {
        saveIntenshipId(user.id);
        context.push(Routes.absenceHistory);
      },
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Row(
          children: [
            Container(
              width: 61,
              height: 61,
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary1,
              ),
              child: Image.asset('assets/icon_student.png'),
            ),
            const Gap(16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${user.fullName}\n',
                    style: AppTextStyle.paragraphL.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  TextSpan(
                    text: user.email,
                    style: AppTextStyle.paragraphL.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Kelas 8A',
              style: AppTextStyle.paragraphM.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
