import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';

class NumpadButton extends StatelessWidget {
  final String title;
  const NumpadButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Get.find<TransactionController>().enterPaymentAmount(title),
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(
          Color(0x40FFFFFF),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppText.semibold25White,
        ),
      ),
    );
  }
}
