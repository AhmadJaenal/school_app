import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/routing/app_routes.dart';
import 'package:school_app/features/auth/presentation/bloc/register_cubit.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';
import 'package:school_app/widgets/buttons/custom_button.dart';
import 'package:school_app/widgets/forms/custom_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nisnC = TextEditingController();
  final TextEditingController _nipnC = TextEditingController();
  final TextEditingController _namaC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _noTelpC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _konfimasiPC = TextEditingController();
  final TextEditingController _alamatC = TextEditingController();

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

  final List<String> _optionStaff = ['Pilih', 'TU', 'Wakil Kepala Sekolah'];
  final formKey = GlobalKey<FormState>();
  String _selectedClass = 'Pilih';
  String _selectedReligion = 'Pilih';
  String _selectedStaffPosition = 'Pilih';

  @override
  void dispose() {
    _nisnC.dispose();
    _nipnC.dispose();
    _namaC.dispose();
    _emailC.dispose();
    _noTelpC.dispose();
    _passwordC.dispose();
    _konfimasiPC.dispose();
    _alamatC.dispose();
    super.dispose();
  }

  Map<String, dynamic> _payloadForRole(int tabIndex) {
    final common = <String, dynamic>{
      'username': _emailC.text.trim(),
      'full_name': _namaC.text.trim(),
      'email': _emailC.text.trim(),
      'phone_number': _noTelpC.text.trim(),
      'address': _alamatC.text.trim(),
      'religion': _selectedReligion,
      'password': _passwordC.text,
      'password_confirmation': _konfimasiPC.text,
    };

    switch (tabIndex) {
      case 0:
        return {
          ...common,
          'student_number': _nisnC.text.trim(),
          'class_name': _selectedClass,
        };
      case 1:
        return {...common, 'nip': _nipnC.text.trim()};
      case 2:
        return {...common, 'position': _selectedStaffPosition};
      default:
        return common;
    }
  }

  String _roleForTab(int tabIndex) {
    return const ['student', 'teacher', 'staff', 'parent'][tabIndex];
  }

  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Registrasi berhasil')));
          context.go(Routes.login);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
      },
      builder: (context, registerState) {
        final isLoading = registerState is RegisterLoading;
        TabBar tabBar = TabBar(
          labelStyle: AppTextStyle.paragraphLBold.copyWith(
            color: AppColors.white,
          ),
          indicator: BoxDecoration(
            color: AppColors.primary1,
            borderRadius: BorderRadius.circular(8),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: AppTextStyle.paragraphLBold.copyWith(
            color: AppColors.primary1,
          ),
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
                titleButton: isLoading ? 'Memproses...' : 'Daftar',
                ontap: () {
                  if (isLoading || !formKey.currentState!.validate()) {
                    return;
                  }
                  if (_passwordC.text != _konfimasiPC.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Konfirmasi password tidak sama'),
                      ),
                    );
                    return;
                  }
                  final tabIndex = DefaultTabController.of(context).index;
                  context.read<RegisterCubit>().submit(
                    data: _payloadForRole(tabIndex),
                    role: _roleForTab(tabIndex),
                  );
                },
              ),
              const Gap(18),
              GestureDetector(
                onTap: () {
                  context.go(Routes.login);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphM.copyWith(
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Sudah punya akun? '),
                        TextSpan(
                          text: ' Masuk',
                          style: AppTextStyle.paragraphM.copyWith(
                            color: const Color(0xff3085FE),
                          ),
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
                onChanged: (value) {
                  setState(() => _selectedClass = value);
                },
              ),
              CustomTextArea(
                hintText: 'Masukan alamat',
                textController: _alamatC,
              ),
              CustomDropdown(
                titleTextField: 'Agama',
                option: _optionReligion,
                onChanged: (value) {
                  setState(() => _selectedReligion = value);
                },
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
              CustomTextArea(
                hintText: 'Masukan alamat',
                textController: _alamatC,
              ),
              CustomDropdown(
                titleTextField: 'Agama',
                option: _optionReligion,
                onChanged: (value) {
                  setState(() => _selectedReligion = value);
                },
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
              CustomTextArea(
                hintText: 'Masukan alamat',
                textController: _alamatC,
              ),
              CustomDropdown(
                titleTextField: 'Agama',
                option: _optionReligion,
                onChanged: (value) {
                  setState(() => _selectedReligion = value);
                },
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
                onChanged: (value) {
                  setState(() => _selectedReligion = value);
                },
              ),
              CustomTextArea(
                hintText: 'Masukan alamat',
                textController: _alamatC,
              ),
              CustomDropdown(
                titleTextField: 'Posisi',
                option: _optionStaff,
                onChanged: (value) {
                  setState(() => _selectedStaffPosition = value);
                },
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
                    horizontal: AppMargin.defaultMargin,
                    vertical: 10,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.h1.copyWith(color: AppColors.black),
                      children: <TextSpan>[
                        const TextSpan(text: 'Daftar Akun Baru\n'),
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
                  staffPage(),
                  parentPage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
