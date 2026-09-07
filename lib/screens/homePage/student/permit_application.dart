import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';

class PermitApplication extends StatefulWidget {
  const PermitApplication({super.key});

  @override
  State<PermitApplication> createState() => _PermitApplicationState();
}

class _PermitApplicationState extends State<PermitApplication> {
  final List<String> _optionAbsence = [
    'Pilih',
    'Izin',
    'Sakit',
  ];

  final formKey = GlobalKey<FormState>();
  final TextEditingController _descController = TextEditingController();
  String? selectedAbsenceType;

  late Future<bool> _presenceFuture;
  PresenceProvider presence = PresenceProvider();

  @override
  void initState() {
    super.initState();
    _presenceFuture = presence.checkPresenceToday();
  }

  @override
  Widget build(BuildContext context) {
    var loading = const Center(child: CircularProgressIndicator());
    doPresence({required String absenType}) {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            presence.addPresencePermission(status: absenType, type: '-');

        successfulMessage.then((response) {
          if (response['status']) {
            Presence presence = response['data'];
            Navigator.of(context).pushReplacementNamed('/absence-history');
            popUpPresence(context, true);
          } else {
            popUpPresence(context, false);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
        ),
        title: Text(
          'Form Izin',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              titleTextField: 'Jenis Izin',
              option: _optionAbsence,
            ),
            const Gap(15),
            Text(
              'Deskripsi',
              style: AppTextStyle.paragraphM.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(6),
            CustomTextArea(
              hintText: 'Contoh: Ada urusan keluarga',
              textController: _descController,
            ),
            Text(
              'Foto Bukti',
              style: AppTextStyle.paragraphM.copyWith(
                color: AppColors.black100,
              ),
            ),
            const Gap(6),
            GestureDetector(
              onTap: () {
                context.push('/camera');
              },
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.black60,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 45,
                      color: AppColors.black80,
                    ),
                    Text(
                      'Ambil Gambar',
                      style: AppTextStyle.h3.copyWith(
                        color: AppColors.black80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(15),
            PrimaryButton(titleButton: 'Kirim', ontap: () {}),
          ],
        ),
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
