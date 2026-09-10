import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/core/presentation/bloc/async_state.dart';
import 'package:school_app/features/school/presentation/bloc/school_cubit.dart';
import 'package:school_app/models/school.dart';

class ListSchool extends StatelessWidget {
  const ListSchool({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SchoolCubit(sl())..load(),
    child: Scaffold(
      appBar: AppBar(title: const Text('Daftar Sekolah')),
      body: BlocBuilder<SchoolCubit, AsyncState<List<SchoolModel>>>(
        builder: (context, state) {
          if (state.status == AsyncStatus.loading)
            return const Center(child: CircularProgressIndicator());
          if (state.status == AsyncStatus.failure)
            return Center(child: Text(state.message ?? 'Gagal memuat sekolah'));
          final schools = state.data ?? const <SchoolModel>[];
          return ListView.builder(
            itemCount: schools.length,
            itemBuilder: (_, index) =>
                ListTile(title: Text(schools[index].name ?? 'Sekolah')),
          );
        },
      ),
    ),
  );
}
