import 'package:flutter/material.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final Function(String?) onChanged;
  final bool isTerm;
  const CustomInputField({
    Key? key,
    required this.title,
    required this.onChanged,
    this.isTerm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20, top: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppText.regular12Grey,
          ),
          Row(
            children: [
              Visibility(
                visible: !isTerm,
                child: const Text(
                  '£',
                  style: AppText.medium16DarkGrey,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: TextField(
                    onChanged: onChanged,
                    keyboardType: TextInputType.number,
                    style: AppText.medium16DarkGrey,
                    cursorColor: AppColors.darkGrey,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 14, left: 5),
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
