import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/core/presentation/bloc/async_state.dart';
import 'package:school_app/features/dailyTest/domain/entities/daily_test.dart';
import 'package:school_app/features/dailyTest/presentation/bloc/daily_test_cubit.dart';
import 'package:school_app/models/pagination_model.dart';

class DailyTestPage extends StatelessWidget {
  const DailyTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DailyTestCubit(sl())..load(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('Ulangan Harian', style: AppTextStyle.h2),
          centerTitle: true,
        ),
        body:
            BlocBuilder<
              DailyTestCubit,
              AsyncState<PaginationResult<DailyTestEntity>>
            >(
              builder: (context, state) {
                if (state.status == AsyncStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status == AsyncStatus.failure) {
                  return Center(
                    child: Text(state.message ?? 'Gagal memuat ulangan'),
                  );
                }
                final tests = state.data?.data ?? const <DailyTestEntity>[];
                if (tests.isEmpty) {
                  return const Center(child: Text('Belum ada ulangan harian'));
                }
                return ListView.separated(
                  padding: EdgeInsets.all(AppMargin.defaultMargin),
                  itemCount: tests.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.black20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tests[index].title ?? 'Ulangan Harian',
                          style: AppTextStyle.paragraphLBold,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tests[index].date ?? '-',
                          style: AppTextStyle.paragraphM,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
