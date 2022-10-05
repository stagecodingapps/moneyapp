import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:money_app/app/modules/transaction/views/widgets/close_button.dart';
import 'package:money_app/app/modules/transaction/views/widgets/underline_input_field.dart';
import 'package:money_app/app/modules/transaction/views/widgets/white_button.dart';

class ToWhomView extends StatelessWidget {
  ToWhomView({Key? key}) : super(key: key);

  final controller = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: CustomCloseButton(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'MoneyApp',
                  style: AppText.semibold16White,
                ),
              ),
              const Text(
                'To whom?',
                style: AppText.semibold25White,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: UnderlineInputField(
                  onChanged: (value) =>
                      controller.setTransactionName(value ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: WhiteButton(
                  title: 'Pay',
                  onPressed: () => controller.addTransaction(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
