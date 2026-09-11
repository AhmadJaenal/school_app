import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/exam/domain/entities/exam_entities.dart';
import 'package:school_app/features/exam/presentation/bloc/exam_cubit.dart';
import 'package:school_app/helpers/bloc_helper.dart';
import 'package:school_app/models/pagination_model.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExamCubit(sl())..load(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('Ujian dan Quiz', style: AppTextStyle.h2),
          centerTitle: true,
        ),
        body: BlocBuilder<ExamCubit, DataState<PaginationResult<ExamEntity>>>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_) => const _Message(message: 'Gagal memuat ujian'),
            success: (page) {
              final exams = page.data;
              if (exams.isEmpty) {
                return const _Message(message: 'Belum ada ujian');
              }
              return ListView.separated(
                padding: EdgeInsets.all(AppMargin.defaultMargin),
                itemCount: exams.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, index) => _ExamCard(exam: exams[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  const _ExamCard({required this.exam});
  final ExamEntity exam;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.black20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exam.examName ?? 'Ujian', style: AppTextStyle.paragraphLBold),
        const SizedBox(height: 8),
        Text(
          '${exam.examType ?? 'Quiz'}  |  ${exam.date ?? '-'}',
          style: AppTextStyle.paragraphM,
        ),
        const SizedBox(height: 4),
        Text(
          '${exam.startTime ?? '-'} - ${exam.endTime ?? '-'}',
          style: AppTextStyle.paragraphS.copyWith(color: AppColors.black80),
        ),
      ],
    ),
  );
}

class _Message extends StatelessWidget {
  const _Message({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) => Center(child: Text(message));
}
