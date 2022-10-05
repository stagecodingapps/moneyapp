import 'package:flutter/material.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function() onPressed;
  const CustomIconButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: const MaterialStatePropertyAll(AppColors.pink20),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: AppText.medium12Black,
          ),
        ],
      ),
    );
  }
}
