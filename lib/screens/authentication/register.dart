import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final TextEditingController _nisnC = TextEditingController();
final TextEditingController _nipnC = TextEditingController();
final TextEditingController _namaC = TextEditingController();
final TextEditingController _emailC = TextEditingController();
final TextEditingController _noTelpC = TextEditingController();
final TextEditingController _passwordC = TextEditingController();
final TextEditingController _konfimasiPC = TextEditingController();
final TextEditingController _alamatC = TextEditingController();
@override
void dispose() {
  _nisnC.dispose();
  _nipnC.dispose();
  _namaC.dispose();
  _emailC.dispose();
  _noTelpC.dispose();
  _konfimasiPC.dispose();
  _alamatC.dispose();
}

List<String> _optionClass = [
  'Pilih',
  'RPL 1',
  'RPL 2',
  'RPL 3',
  'RPL 4',
  'RPL 5',
];
List<String> _optionReligion = [
  'Pilih',
  'Islam',
  'Kristen',
  'Hindu',
  'Budha',
  'Khonghucu',
];

List<String> _optionStaff = [
  'Pilih',
  'TU',
  'Wakil Kepala Sekolah',
];

class _RegisterState extends State<Register> {
  @override
  int _selected = 0;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget studentPage() {
      return Column(
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
        ],
      );
    }

    Widget teacherPage() {
      return Column(
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
        ],
      );
    }

    Widget parentPage() {
      return Column(
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
        ],
      );
    }

    Widget staffPage() {
      return Column(
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
        ],
      );
    }

    List<Widget> _selectedPage = [
      studentPage(),
      teacherPage(),
      parentPage(),
      staffPage(),
    ];

    Widget customRadio(String titleValue, int index) {
      return Column(
        children: [
          Container(
            width: width * .21,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.black40,
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selected = index;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selected == index ? AppColors.primary1 : AppColors.black40,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                titleValue,
                style: AppTextStyle.paragraphLBold.copyWith(
                  color:
                      _selected == index ? AppColors.white : AppColors.primary1,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const Gap(37),
              Text(
                "Daftar Akun Baru",
                style: AppTextStyle.h1.copyWith(
                  color: AppColors.black,
                ),
              ),
              const Gap(5),
              Text(
                "Halo, silakan pilih jenis akun",
                style: AppTextStyle.paragraphSecondaryS.copyWith(
                  color: AppColors.black60,
                ),
              ),
              const Gap(10),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.black40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customRadio('Siswa', 0),
                    customRadio('Guru', 1),
                    customRadio('Wali', 2),
                    customRadio('Staff', 3),
                  ],
                ),
              ),
              _selectedPage[_selected],
              const Gap(10),
              PrimaryButton(titleButton: 'Daftar', ontap: () {}),
              const Gap(18),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphM
                          .copyWith(color: AppColors.black),
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
          ),
        ),
      ),
    );
  }
}
