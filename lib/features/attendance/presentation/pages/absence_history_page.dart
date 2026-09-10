import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/core/presentation/bloc/async_state.dart';
import 'package:school_app/features/attendance/domain/entities/attendance.dart';
import 'package:school_app/features/attendance/presentation/bloc/attendance_cubit.dart';

class AbsenceHistory extends StatelessWidget {
  const AbsenceHistory({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => AttendanceCubit(sl())..load(),
    child: Scaffold(
      appBar: AppBar(title: const Text('Riwayat Absensi')),
      body: BlocBuilder<AttendanceCubit, AsyncState<List<Attendance>>>(
        builder: (context, state) {
          if (state.status == AsyncStatus.loading)
            return const Center(child: CircularProgressIndicator());
          if (state.status == AsyncStatus.failure)
            return Center(child: Text(state.message ?? 'Gagal memuat absensi'));
          final records = state.data ?? const <Attendance>[];
          if (records.isEmpty)
            return const Center(child: Text('Belum ada data absensi'));
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(records[index].status),
              subtitle: Text(records[index].date),
            ),
          );
        },
      ),
    ),
  );
}
