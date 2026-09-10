import 'dart:async';

import 'package:flutter/foundation.dart';

/// Menjembatani Stream (mis. dari BLoC) menjadi Listenable
/// agar bisa dipakai sebagai `refreshListenable` di GoRouter.
///
/// Ini dibutuhkan karena GoRouter tidak tahu soal BLoC/Stream secara
/// langsung — dia hanya paham `Listenable`. Setiap kali stream
/// mengeluarkan event baru (mis. AuthBloc emit state login/logout),
/// GoRouter akan otomatis re-evaluate `redirect`.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
