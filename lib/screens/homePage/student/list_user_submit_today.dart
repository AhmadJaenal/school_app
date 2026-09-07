import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/submission/submission_service.dart';
import 'package:school_app/shared/theme.dart';

class UsersSubmittedTasksToday extends StatelessWidget {
  const UsersSubmittedTasksToday({super.key});

  @override
  Widget build(BuildContext context) {
    SubmissionProvider submissionProvider = Provider.of<SubmissionProvider>(
      context,
    );

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
        future: submissionProvider.getAllUserSubmittedTask(),
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
            itemBuilder: (context, index) => const Text('Test'),
          );
        },
      ),
    );
  }
}
