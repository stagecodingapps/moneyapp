import 'package:flutter/material.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';

class UnderlineInputField extends StatelessWidget {
  final Function(String?) onChanged;
  const UnderlineInputField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: AppColors.white,
      textAlign: TextAlign.center,
      style: AppText.semibold18White,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 3),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
      ),
    );
  }
}
