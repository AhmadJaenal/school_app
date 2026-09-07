import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/theme.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({super.key});

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  final TextEditingController _descController =
      TextEditingController(text: 'jgk@gmail.com');

  final TextEditingController _titleController =
      TextEditingController(text: 'hadjsdf');

  @override
  void dispose() {
    super.dispose();
    _descController.dispose();
    _titleController.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Form',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  'assets/img_add_children.png',
                  width: width * .8,
                ),
              ),
              const Gap(24),
              Text(
                'Tugaskan Peserta Magang',
                style: AppTextStyle.h1,
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              Text(
                'Pilih peserta dan proyek\nyang akan ditugaskan',
                style: AppTextStyle.paragraphL.copyWith(
                  color: AppColors.black60,
                ),
                textAlign: TextAlign.center,
              ),
              CustomDropdown(
                titleTextField: 'Pilih Peserta',
                option: const [
                  'Pilih',
                  'Budi Septian',
                  'Siti Aminah',
                  'Rizky Pratama'
                ],
                onChanged: (_) {},
              ),
              CustomDropdown(
                titleTextField: 'Pilih Proyek',
                option: const [
                  'Pilih',
                  'Membuat desain aplikasi sekolah',
                  'Menyusun dokumentasi proyek',
                  'Membuat prototipe dashboard',
                ],
                onChanged: (_) {},
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: PrimaryButton(
          titleButton: "Simpan",
          ontap: () {
            if (formKey.currentState!.validate()) {
              context.pop();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
