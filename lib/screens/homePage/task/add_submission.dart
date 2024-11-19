import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_app/core/platform/status.dart';
import '../../../services/submission/submission_service.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_popup_message.dart';

import '../../../shared/theme.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AddSubmission extends StatefulWidget {
  const AddSubmission({super.key});

  @override
  State<AddSubmission> createState() => _AddSubmissionState();
}

final formKey = GlobalKey<FormState>();

QuillController controller = QuillController.basic();

@override
void dispose() {
  controller.dispose();
}

void _clearTextControllers() {
  controller.clear();
}

class _AddSubmissionState extends State<AddSubmission> {
  @override
  Widget build(BuildContext context) {
    SubmissionProvider submission = Provider.of<SubmissionProvider>(context);
    var loading = const Center(child: CircularProgressIndicator());

    doSubmissionTask() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage = submission
            .addNewSubmission(desc: controller.plainTextEditingValue.text);

        successfulMessage.then((response) {
          if (response['status']) {
            Get.back();
            Get.back();
            popUpSubmission(context, true);
          } else {
            popUpSubmission(context, false);
          }
        });
      }
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black100,
          ),
        ),
        title: Text(
          'Tambah Submission',
          style: AppTextStyle.h2.copyWith(color: AppColors.black100),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuillSimpleToolbar(
                      controller: controller,
                      configurations: const QuillSimpleToolbarConfigurations(),
                    ),
                    SizedBox(
                      height: height * .7,
                      child: QuillEditor.basic(
                        controller: controller,
                        configurations: const QuillEditorConfigurations(
                            dialogTheme: QuillDialogTheme(
                          dialogBackgroundColor: Colors.red,
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(AppMargin.defaultMargin),
        child: submission.submissionStatus == ProcessState.uploading
            ? loading
            : PrimaryButton(
                ontap: () {
                  doSubmissionTask();
                  _clearTextControllers();
                },
                titleButton: 'Tambah Submission',
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<dynamic> popUpSubmission(BuildContext context, bool isSuccess) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => PopUpMessage(
          isSuccess: isSuccess,
          successMessage: 'Tugas berhasil dikumpulkan!',
          failedMessage: 'Tugas gagal dikumpulkan!'),
    );
  }
}
