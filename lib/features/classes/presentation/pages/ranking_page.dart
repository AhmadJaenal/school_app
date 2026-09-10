import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Ranking Kelas', style: AppTextStyle.h2),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppMargin.defaultMargin),
        children: [
          const _RankingRow(
            rank: 1,
            name: 'Data ranking tersedia setelah ujian dinilai',
            score: '-',
          ),
        ],
      ),
    );
  }
}

class _RankingRow extends StatelessWidget {
  const _RankingRow({
    required this.rank,
    required this.name,
    required this.score,
  });
  final int rank;
  final String name;
  final String score;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.black20),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary1,
          child: Text('$rank', style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(name, style: AppTextStyle.paragraphLBold)),
        Text(
          score,
          style: AppTextStyle.paragraphLBold.copyWith(
            color: AppColors.primary1,
          ),
        ),
      ],
    ),
  );
}
