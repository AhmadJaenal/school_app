import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/di/injection.dart';
import 'package:school_app/features/notification/domain/entities/notification.dart';
import 'package:school_app/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:school_app/helpers/bloc_helper.dart';
import 'package:school_app/models/pagination_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => NotificationCubit(sl())..load(),
    child: Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body:
          BlocBuilder<
            NotificationCubit,
            DataState<PaginationResult<NotificationEntity>>
          >(
            builder: (context, state) => state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              success: (page) {
                final items = page.data;
                if (items.isEmpty) {
                  return const Center(child: Text('Belum ada notifikasi'));
                }
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
    ),
  );
}
