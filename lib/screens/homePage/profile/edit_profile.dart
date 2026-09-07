import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

TextEditingController nameController =
    TextEditingController(text: 'Ahmad Jaenal Aripin');
TextEditingController emailController =
    TextEditingController(text: 'ahmadJaenal629@gmail.com');
TextEditingController alamatController =
    TextEditingController(text: 'Cingambul');

final List<String> _optionReligion = [
  'Pilih',
  'Islam',
  'Kristen',
  'Hindu',
  'Budha',
  'Khonghucu',
];

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Edit Profil',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          children: [
            const Gap(23),
            Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 103,
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary1,
                  ),
                ),
              ],
            ),
            const Gap(15),
            CustomTextField(
              hintText: 'Masukan Nama',
              titleTextField: 'Nama',
              textController: nameController,
            ),
            CustomTextField(
              hintText: 'Masukan Email',
              titleTextField: 'Email',
              textController: emailController,
            ),
            CustomTextField(
              hintText: 'Masukan Alamat',
              titleTextField: 'Masukan Alamat',
              textController: emailController,
            ),
            CustomDropdown(
              titleTextField: 'Agama',
              option: _optionReligion,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: PrimaryButton(
          titleButton: 'Perbarui',
          ontap: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
