import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import '../../../shared/theme.dart';

class AssignmentProject extends StatelessWidget {
  const AssignmentProject({super.key});

  static const assignments = [
    ('Budi Septian', 'Membuat desain aplikasi sekolah'),
    ('Siti Aminah', 'Menyusun dokumentasi proyek'),
    ('Rizky Pratama', 'Membuat prototipe dashboard'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
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
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: assignments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return _AssignmentCard(
              studentName: assignment.$1,
              projectName: assignment.$2,
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
          context.push(Routes.addAssignment);
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
}

class _AssignmentCard extends StatelessWidget {
  const _AssignmentCard({
    required this.studentName,
    required this.projectName,
  });

  final String studentName;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image_product.png'),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  studentName,
                  style: AppTextStyle.h3.copyWith(color: AppColors.white),
                ),
                Text(
                  projectName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.paragraphM.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 43,
            height: 43,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
