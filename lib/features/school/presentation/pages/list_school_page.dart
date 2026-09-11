import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/school/domain/entities/school.dart';
import 'package:school_app/features/school/presentation/bloc/school_cubit.dart';
import 'package:school_app/helpers/bloc_helper.dart';
import 'package:school_app/models/pagination_model.dart';

class ListSchool extends StatelessWidget {
  const ListSchool({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SchoolCubit(sl())..load(),
    child: Scaffold(
      appBar: AppBar(title: const Text('Daftar Sekolah')),
      body: BlocBuilder<SchoolCubit, DataState<PaginationResult<SchoolEntity>>>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          success: (page) => ListView.builder(
            itemCount: page.data.length,
            itemBuilder: (_, index) =>
                ListTile(title: Text(page.data[index].schoolName ?? 'Sekolah')),
          ),
        ),
      ),
    ),
  );
}
