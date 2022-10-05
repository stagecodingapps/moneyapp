import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';

import '../transaction_view.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 50,
      child: TextButton(
        onPressed: () => Get.back(result: const TransactionsView()),
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(
            Color(0x70F7F7F7),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.close,
              color: AppColors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
