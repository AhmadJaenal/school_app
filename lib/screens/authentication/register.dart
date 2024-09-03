import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';
import 'dart:developer' as developer;

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController _nisnC = TextEditingController();
  final TextEditingController _nipnC = TextEditingController();
  final TextEditingController _namaC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _noTelpC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _konfimasiPC = TextEditingController();
  final TextEditingController _alamatC = TextEditingController();

  void dispose() {
    _nisnC.dispose();
    _nipnC.dispose();
    _namaC.dispose();
    _emailC.dispose();
    _noTelpC.dispose();
    _konfimasiPC.dispose();
    _alamatC.dispose();
  }

  void _clearTextControllers() {
    _nisnC.clear();
    _nipnC.clear();
    _namaC.clear();
    _emailC.clear();
    _noTelpC.clear();
    _passwordC.clear();
    _konfimasiPC.clear();
    _alamatC.clear();
  }

  final List<String> _optionClass = [
    'Pilih',
    'RPL 1',
    'RPL 2',
    'RPL 3',
    'RPL 4',
    'RPL 5',
  ];

  final List<String> _optionReligion = [
    'Pilih',
    'Islam',
    'Kristen',
    'Hindu',
    'Budha',
    'Khonghucu',
  ];

  final List<String> _optionStaff = [
    'Pilih',
    'TU',
    'Wakil Kepala Sekolah',
  ];
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      labelStyle: AppTextStyle.paragraphLBold.copyWith(color: AppColors.white),
      indicator: BoxDecoration(
          color: AppColors.primary1, borderRadius: BorderRadius.circular(8)),
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle:
          AppTextStyle.paragraphLBold.copyWith(color: AppColors.primary1),
      tabs: const [
        Tab(text: 'Siswa'),
        Tab(text: 'Guru'),
        Tab(text: 'Staff'),
        Tab(text: 'Wali'),
      ],
    );

    Widget buttonSubmit() {
      return Column(
        children: [
          const Gap(10),
          PrimaryButton(
              titleButton: 'Daftar',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  _clearTextControllers();
                  developer.log('validari berhasil');
                } else {
                  developer.log('validari gagal');
                }
              }),
          const Gap(18),
          GestureDetector(
            onTap: () {
              Get.toNamed('/login');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  style:
                      AppTextStyle.paragraphM.copyWith(color: AppColors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Sudah punya akun? ',
                    ),
                    TextSpan(
                      text: ' Masuk',
                      style: AppTextStyle.paragraphM
                          .copyWith(color: const Color(0xff3085FE)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(18),
        ],
      );
    }

    Widget studentPage() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        children: [
          CustomTextField(
            titleTextField: 'NISN',
            hintText: 'Masukan NISN',
            textController: _nisnC,
          ),
          CustomTextField(
            titleTextField: 'Nama',
            hintText: 'Masukan nama',
            textController: _namaC,
          ),
          CustomTextField(
            titleTextField: 'Email',
            hintText: 'Masukan email',
            textController: _emailC,
          ),
          CustomTextField(
            titleTextField: 'No Telp',
            hintText: 'Masukan No Telp',
            textController: _noTelpC,
          ),
          CustomDropdown(
            titleTextField: 'Kelas',
            option: _optionClass,
          ),
          CustomTextArea(hintText: 'Masukan alamat', textController: _alamatC),
          CustomDropdown(
            titleTextField: 'Agama',
            option: _optionReligion,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan password',
            textController: _passwordC,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan konfirmasi password',
            textController: _konfimasiPC,
          ),
          buttonSubmit(),
        ],
      );
    }

    Widget teacherPage() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        children: [
          CustomTextField(
            titleTextField: 'NIP',
            hintText: 'Masukan NIP',
            textController: _nipnC,
          ),
          CustomTextField(
            titleTextField: 'Nama',
            hintText: 'Masukan nama',
            textController: _namaC,
          ),
          CustomTextField(
            titleTextField: 'Email',
            hintText: 'Masukan email',
            textController: _emailC,
          ),
          CustomTextField(
            titleTextField: 'No Telp',
            hintText: 'Masukan No Telp',
            textController: _noTelpC,
          ),
          CustomTextArea(hintText: 'Masukan alamat', textController: _alamatC),
          CustomDropdown(
            titleTextField: 'Agama',
            option: _optionReligion,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan password',
            textController: _passwordC,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan konfirmasi password',
            textController: _konfimasiPC,
          ),
          buttonSubmit(),
        ],
      );
    }

    Widget parentPage() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        children: [
          CustomTextField(
            titleTextField: 'Nama',
            hintText: 'Masukan nama',
            textController: _namaC,
          ),
          CustomTextField(
            titleTextField: 'Email',
            hintText: 'Masukan email',
            textController: _emailC,
          ),
          CustomTextField(
            titleTextField: 'No Telp',
            hintText: 'Masukan No Telp',
            textController: _noTelpC,
          ),
          CustomTextArea(hintText: 'Masukan alamat', textController: _alamatC),
          CustomDropdown(
            titleTextField: 'Agama',
            option: _optionReligion,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan password',
            textController: _passwordC,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan konfirmasi password',
            textController: _konfimasiPC,
          ),
          buttonSubmit(),
        ],
      );
    }

    Widget staffPage() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        children: [
          CustomTextField(
            titleTextField: 'Nama',
            hintText: 'Masukan nama',
            textController: _namaC,
          ),
          CustomTextField(
            titleTextField: 'Email',
            hintText: 'Masukan email',
            textController: _emailC,
          ),
          CustomTextField(
            titleTextField: 'No Telp',
            hintText: 'Masukan No Telp',
            textController: _noTelpC,
          ),
          CustomDropdown(
            titleTextField: 'Agama',
            option: _optionReligion,
          ),
          CustomTextArea(hintText: 'Masukan alamat', textController: _alamatC),
          CustomDropdown(
            titleTextField: 'Posisi',
            option: _optionStaff,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan password',
            textController: _passwordC,
          ),
          CustomTextFieldPassword(
            titleTextField: 'Password',
            hintText: 'Masukan konfirmasi password',
            textController: _konfimasiPC,
          ),
          buttonSubmit(),
        ],
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: AppBar(
            toolbarHeight: 80,
            leadingWidth: double.infinity,
            leading: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMargin.defaultMargin, vertical: 10),
              child: RichText(
                text: TextSpan(
                  style: AppTextStyle.h1.copyWith(color: AppColors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Daftar Akun Baru\n',
                    ),
                    TextSpan(
                      text: 'Halo, silakan pilih jenis akun',
                      style: AppTextStyle.paragraphSecondaryS.copyWith(
                        color: AppColors.black60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.defaultMargin,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black40,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: tabBar,
              ),
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: TabBarView(
            children: [
              studentPage(),
              teacherPage(),
              parentPage(),
              staffPage(),
            ],
          ),
        ),
      ),
    );
  }
}
