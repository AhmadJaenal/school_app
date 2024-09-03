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
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'DATA TIDAK BOLEH KOSONG';
            }
            return null;
          },
          controller: textController,
          textAlignVertical: TextAlignVertical.bottom,
          style: AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
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
        SizedBox(
          height: 150,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'DATA TIDAK BOLEH KOSONG';
              }
              return null;
            },
            maxLines: 5,
            controller: textController,
            textAlignVertical: TextAlignVertical.top,
            style: AppTextStyle.paragraphLBold.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
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
  bool _showPassword = true;
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
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'PASSWORD TIDAK BOLEH KOSONG';
            }
            return null;
          },
          controller: widget.textController,
          obscureText: _showPassword ? true : false,
          textAlignVertical: TextAlignVertical.bottom,
          style: AppTextStyle.paragraphL
              .copyWith(color: AppColors.black, fontWeight: AppWeightFont.bold),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            suffixIcon: IconButton(
              icon: _showPassword
                  ? Image.asset('assets/icon_hide_pass.png', width: 24)
                  : Image.asset('assets/icon_eye.png', width: 24),
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
      ],
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final List<String> option;
  final String titleTextField;
  const CustomDropdown(
      {super.key, required this.option, required this.titleTextField});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String _selectedItem = 'Pilih';
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
        SizedBox(
          width: double.infinity,
          child: DropdownButtonFormField<String>(
            validator: (value) {
              if (value == 'Pilih') {
                return 'PILIH DATA DENGAN SESUAI';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.black60,
                ),
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            isExpanded: true,
            borderRadius: BorderRadius.circular(8),
            style: AppTextStyle.paragraphL.copyWith(
              color: AppColors.black80,
            ),
            elevation: 0,
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
            items: widget.option.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                alignment: Alignment.centerLeft,
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
