import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/widgets/card_menu_home_page.dart';

import '../../../datasource/local_datasource.dart';
import '../../../models/user.dart';
import '../../../services/presence_service.dart';
import '../../../shared/theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_popup_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

Future<String> getAddressFromLatLng() async {
  Position position = await _determinePosition();
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    String address = "${place.street}, ${place.locality}";
    return address;
  } catch (e) {
    return 'Failed to get address';
  }
}

class _HomePageState extends State<HomePage> {
  List<List<String>> event = [
    ['img_event_1.png', 'Acara Idul Adha', '12 Juni 2023'],
    ['img_event_2.png', 'Acara Idul Adha', '12 Juni 2023'],
    ['img_event_3.png', 'Acara Idul Adha', '12 Juni 2023'],
  ];

  @override
  void initState() {
    super.initState();
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    UserPreferences userPrefs = UserPreferences();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
            child: Row(
              children: [
                Image.asset('assets/icon_profile.png', width: 64),
                const Gap(28),
                FutureBuilder(
                    future: userPrefs.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        User userData = snapshot.data!;
                        return RichText(
                          text: TextSpan(
                            style: AppTextStyle.h3
                                .copyWith(color: AppColors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${userData.fullName!} \n",
                              ),
                              TextSpan(
                                text: userData.roles![0]
                                        .substring(0, 1)
                                        .toUpperCase() +
                                    userData.roles![0].substring(1),
                                style: AppTextStyle.paragraphL
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed('/notification'),
                  child: Image.asset('assets/icon_notification.png', width: 28),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('intern')) {
                  User userData = snapshot.data!;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMargin.defaultMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kehadiran Hari Ini',
                            style: AppTextStyle.paragraphLBold),
                        GestureDetector(
                          onTap: () => Get.toNamed('/absence-history'),
                          child: Text(
                            'Rekap Absen',
                            style: AppTextStyle.paragraphM
                                .copyWith(color: AppColors.primary1),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Gap(14),
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('staff')) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * .44,
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(width: 1, color: AppColors.black40),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          AppColors.info1.withOpacity(.1),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        )),
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/icon_login.png',
                                      width: 24,
                                    ),
                                  ),
                                  Text('Hari ini',
                                      style: AppTextStyle.paragraphM),
                                ],
                              ),
                              const Gap(8),
                              Text('07:00', style: AppTextStyle.h3),
                              const Gap(8),
                              Text('Riwayat Pengerjaan',
                                  style: AppTextStyle.paragraphM),
                            ],
                          ),
                        ),
                        Container(
                          width: width * .44,
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(width: 1, color: AppColors.black40),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          AppColors.info1.withOpacity(.1),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        )),
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/icon_logout.png',
                                      width: 24,
                                    ),
                                  ),
                                  Text('Kemajuan',
                                      style: AppTextStyle.paragraphM),
                                ],
                              ),
                              const Gap(8),
                              Text('15:20', style: AppTextStyle.h3),
                              const Gap(8),
                              Text('Tanpa Progres',
                                  style: AppTextStyle.paragraphM),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Gap(12),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Event', style: AppTextStyle.paragraphLBold),
                  GestureDetector(
                    onTap: () => Get.toNamed('/list-event'),
                    child: Text(
                      'Lihat Semua',
                      style: AppTextStyle.paragraphM
                          .copyWith(color: AppColors.primary1),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            CarouselSlider(
              options: CarouselOptions(height: 124.0),
              items: event.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/${data[0]}'),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                'Acara Idul Adha',
                                style: AppTextStyle.h3
                                    .copyWith(color: AppColors.white),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined,
                                      color: AppColors.white, size: 16),
                                  const Gap(8),
                                  Text(
                                    '12 Juni 2023',
                                    style: AppTextStyle.paragraphM
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            icon: Container(
                              width: 43,
                              height: 43,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Gap(16),
            Padding(
              padding: EdgeInsets.only(left: AppMargin.defaultMargin),
              child: Text('Menu', style: AppTextStyle.paragraphLBold),
            ),
            const Gap(12),
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('intern')) {
                  User userData = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardMenu(
                          title: 'Tugas',
                          titleButton: 'Lihat',
                          desc: 'Daftar tugas yang harus dikerjakan',
                          onTap: () => Get.toNamed('/list-project'),
                        ),
                        CardMenu(
                          title: 'Izin Absen',
                          titleButton: 'Ajukan Izin',
                          desc: 'Isi form untuk meminta izin absen',
                          onTap: () => Get.toNamed('/permit-application'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            FutureBuilder(
              future: userPrefs.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.roles!.contains('staff')) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.start,
                      children: [
                        CardMenu(
                          title: 'Sekolah',
                          titleButton: 'Lihat',
                          desc: 'Daftar sekolah yang sedang melakukan magang',
                          onTap: () => Get.toNamed('/list-school'),
                        ),
                        CardMenu(
                          title: 'Siswa',
                          titleButton: 'Lihat',
                          desc:
                              'Daftar siswa yang sedang melakukan kerja praktek',
                          onTap: () => Get.toNamed('/list-student'),
                        ),
                        CardMenu(
                          title: 'Proyek',
                          titleButton: 'Lihat',
                          desc: 'Daftar proyek yang tersedia',
                          onTap: () => Get.toNamed('/list-project'),
                        ),
                        CardMenu(
                          title: 'Tugas',
                          titleButton: 'Lihat',
                          desc: 'Daftar tugas untuk siswa',
                          onTap: () => Get.toNamed('/list-task'),
                        ),
                        CardMenu(
                          title: 'Penugasan',
                          titleButton: 'Lihat',
                          desc: 'Daftar penugasan peserta magang',
                          onTap: () => Get.toNamed('/assignment-project'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Gap(16),
          ],
        ),
        floatingActionButton: FutureBuilder(
          future: userPrefs.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.roles!.contains('intern')) {
              User userData = snapshot.data!;
              return PresenceWidget(height: height);
            } else {
              return const SizedBox();
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class PresenceWidget extends StatelessWidget {
  PresenceWidget({
    super.key,
    required this.height,
  });

  final double height;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime dateNow = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy', 'id').format(dateNow);
    String formattedTime = DateFormat('HH:mm', 'id').format(dateNow);

    PresenceProvider presence = Provider.of<PresenceProvider>(context);
    var loading = const Center(child: CircularProgressIndicator());

    doPresence() {
      final Future<Map<String, dynamic>> successfulMessage =
          presence.addPresencePermission(status: 'Hadir', type: 'WFA');
      successfulMessage.then((response) {
        if (response['status']) {
          Navigator.of(context).pushReplacementNamed('/absence-history');
          popUpPresence(context, true);
        } else {
          popUpPresence(context, false);
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: PrimaryButtonWithIcon(
        titleButton: 'Tekan untuk Presensi Masuk',
        ontap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 360,
                padding: EdgeInsets.symmetric(
                  vertical: 38,
                  horizontal: AppMargin.defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Presensi Masuk',
                      style: AppTextStyle.h2.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: AppColors.primary1),
                        const Gap(18),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tanggal Masuk\n',
                                style: AppTextStyle.paragraphLBold
                                    .copyWith(color: AppColors.black),
                              ),
                              TextSpan(
                                text: formattedDate,
                                style: AppTextStyle.paragraphM
                                    .copyWith(color: AppColors.black80),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: AppColors.primary1),
                        const Gap(18),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jam Masuk\n',
                                style: AppTextStyle.paragraphLBold
                                    .copyWith(color: AppColors.black),
                              ),
                              TextSpan(
                                text: formattedTime,
                                style: AppTextStyle.paragraphM
                                    .copyWith(color: AppColors.black80),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: AppColors.primary1),
                        const Gap(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lokasi',
                                style: AppTextStyle.paragraphLBold
                                    .copyWith(color: AppColors.black)),
                            FutureBuilder(
                              future: getAddressFromLatLng(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SizedBox(
                                      width: 10, height: 10, child: Text('-'));
                                }
                                if (!snapshot.hasData) {
                                  return const Text('terjadi kesalahan');
                                }

                                return Text(snapshot.data.toString(),
                                    style: AppTextStyle.paragraphM
                                        .copyWith(color: AppColors.black80));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(24),
                    // Text(
                    //   'Foto selfie di area sekolah',
                    //   style: AppTextStyle.paragraphL.copyWith(
                    //     color: AppColors.black80,
                    //   ),
                    // ),
                    // const Gap(11),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.toNamed('/camera-face-detection');
                    //     // _getImageFromCamera();
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 280,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(
                    //         color: AppColors.black60,
                    //         width: 1,
                    //       ),
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Icon(
                    //           Icons.camera_alt,
                    //           size: 45,
                    //           color: AppColors.black80,
                    //         ),
                    //         Text(
                    //           'Ambil Gambar',
                    //           style: AppTextStyle.h3.copyWith(
                    //             color: AppColors.black80,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const Gap(16),
                    FutureBuilder<bool>(
                      future: presence.checkPresenceToday(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError ||
                            presence.presenceStatus == ProcessState.uploading) {
                          return loading;
                        }

                        return PrimaryButton(
                          titleButton: 'Hadir',
                          ontap: () => doPresence(),
                          disable: snapshot.data ?? false,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(Icons.circle_outlined, color: AppColors.white),
      ),
    );
  }

  Future<dynamic> popUpPresence(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Absensi berhasil!',
          failedMessage: 'Absensi gagal!'),
    );
  }
}
