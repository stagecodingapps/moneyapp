import 'package:flutter/material.dart';
import 'package:money_app/app/config/text_styles.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const WhiteButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Color(0x70F7F7F7),
          ),
          overlayColor: const MaterialStatePropertyAll(
            Color(0x70F7F7F7),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppText.semibold18White,
          ),
        ),
      ),
    );
  }
}
