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

String _selectedItem = 'Pilih';

class _CustomDropdownState extends State<CustomDropdown> {
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
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black80),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            underline: Container(),
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
