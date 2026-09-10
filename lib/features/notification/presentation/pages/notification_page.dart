import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/core/presentation/bloc/async_state.dart';
import 'package:school_app/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:school_app/features/parents/data/models/school_api_models.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => NotificationCubit(sl())..load(),
    child: Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: BlocBuilder<NotificationCubit, AsyncState<List<NotificationModel>>>(
        builder: (context, state) {
          if (state.status == AsyncStatus.loading)
            return const Center(child: CircularProgressIndicator());
          if (state.status == AsyncStatus.failure)
            return Center(
              child: Text(state.message ?? 'Gagal memuat notifikasi'),
            );
          final items = state.data ?? const <NotificationModel>[];
          if (items.isEmpty)
            return const Center(child: Text('Belum ada notifikasi'));
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(items[index].title ?? 'Notifikasi'),
              subtitle: Text(items[index].message ?? ''),
            ),
          );
        },
      ),
    ),
  );
}
