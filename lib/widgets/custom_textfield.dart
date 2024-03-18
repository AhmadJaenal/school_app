import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/shared/theme.dart';

class CustomTextField extends StatelessWidget {
  final String titleTextField;
  final String hintText;
  final TextEditingController textController;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.titleTextField,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Text(
          titleTextField,
          style: AppTextStyle.paragraphM.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        Container(
          height: 52,
          child: TextField(
            controller: textController,
            textAlignVertical: TextAlignVertical.bottom,
            style: AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary1, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextArea extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  const CustomTextArea(
      {super.key, required this.hintText, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Container(
          height: 100,
          child: TextField(
            maxLines: 5,
            controller: textController,
            textAlignVertical: TextAlignVertical.top,
            style: AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary1, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldPassword extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final String titleTextField;

  const CustomTextFieldPassword(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.titleTextField});

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Text(
          widget.titleTextField,
          style: AppTextStyle.paragraphM.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        Container(
          height: 52,
          child: TextField(
            controller: widget.textController,
            obscureText: _showPassword ? true : false,
            textAlignVertical: TextAlignVertical.bottom,
            style: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black, fontWeight: AppWeightFont.bold),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    _showPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_outlined,
                    color: _showPassword
                        ? AppColors.black80
                        : AppColors.secondary1),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary1, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyle.paragraphL.copyWith(
                color: AppColors.black80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
