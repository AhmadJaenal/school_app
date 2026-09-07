import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/screens/homePage/student/card_tile_menu_profile.dart';
import 'package:school_app/services/auth/student_auth.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
          child: Column(
            children: [
              const Gap(17),
              Image.asset(
                'assets/icon_profile.png',
                width: 103,
              ),
              const Gap(6),
              FutureBuilder(
                future: userController.fetchCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return Text(
                      'Budi Septian',
                      style: AppTextStyle.h2.copyWith(
                        color: AppColors.black100,
                      ),
                    );
                  } else {
                    return const Center(child: Text("Tidak ada data"));
                  }
                },
              ),
              Text(
                'Siswa',
                style: AppTextStyle.h3.copyWith(
                  color: AppColors.black80,
                ),
              ),
              const Gap(14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PrimaryButton(
                  titleButton: "Edit Profile",
                  ontap: () => context.push('/profile/edit'),
                ),
              ),
              const Gap(49),
              Row(
                children: [
                  Image.asset('assets/icon_coin.png',
                      width: 24, color: AppColors.primary1),
                  const Gap(16),
                  Text(
                    'Poinku',
                    style: AppTextStyle.paragraphLBold.copyWith(
                      color: AppColors.black100,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '6000',
                    style: AppTextStyle.paragraphL.copyWith(
                      color: AppColors.black100,
                    ),
                  ),
                ],
              ),
              TileMenuProfile(
                icon: 'icon_card_profile.png',
                title: 'Profil Lengkap',
                ontap: () => context.push('/profile/detail'),
              ),
              TileMenuProfile(
                icon: 'icon_history.png',
                title: 'Riwayat Pembayaran',
                ontap: () => context.push('/profile/history-payment'),
              ),
              TileMenuProfile(
                icon: 'icon_password.png',
                title: 'Ganti Password',
                ontap: () => context.push('/profile/change-password'),
              ),
              TileMenuProfile(
                icon: 'icon_box_logout.png',
                title: 'Log out',
                ontap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: 165,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 22),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppMargin.defaultMargin,
                        vertical: 28,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Logout',
                            style: AppTextStyle.h3.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Apakah Anda yakin ingin keluar?',
                            style: AppTextStyle.paragraphL.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                          const Gap(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 130,
                                child: SecondaryButton(
                                    titleButton: 'Batal',
                                    ontap: () => context.pop()),
                              ),
                              SizedBox(
                                width: 130,
                                child: PrimaryButton(
                                  titleButton: 'Logout',
                                  ontap: () {
                                    usertAuth.logOut(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
