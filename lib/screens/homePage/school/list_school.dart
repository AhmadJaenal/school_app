import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/school/domain/usecases/get_schools.dart';
import 'package:school_app/models/school.dart';
import 'package:school_app/widgets/cards/card_school.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_text_styles.dart';

class ListSchool extends StatefulWidget {
  const ListSchool({super.key});

  @override
  State<ListSchool> createState() => _ListSchoolState();
}

class _ListSchoolState extends State<ListSchool> {
  late final Future<List<SchoolModel>> _schoolsFuture;

  @override
  void initState() {
    super.initState();
    _schoolsFuture = sl<GetSchools>().call();
  }

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
          'Daftar Sekolah',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: FutureBuilder<List<SchoolModel>>(
          future: _schoolsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  snapshot.hasError
                      ? 'Gagal memuat daftar sekolah'
                      : 'Tidak ada sekolah yang melakukan magang saat ini',
                  style: AppTextStyle.paragraphL,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  CardSchool(school: snapshot.data![index]),
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
          context.push('/add-school');
        },
        child: Icon(Icons.add, color: AppColors.white, size: 32, weight: 2),
      ),
    );
  }
}
