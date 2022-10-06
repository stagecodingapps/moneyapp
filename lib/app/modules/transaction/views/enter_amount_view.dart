import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:money_app/app/modules/transaction/views/to_whom_view.dart';
import 'package:money_app/app/modules/transaction/views/widgets/close_button.dart';
import 'package:money_app/app/modules/transaction/views/widgets/custom_numpad.dart';
import 'package:money_app/app/modules/transaction/views/widgets/white_button.dart';

class EnterAmountView extends StatelessWidget {
  EnterAmountView({Key? key}) : super(key: key);
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
                'How much?',
                style: AppText.semibold25White,
              ),
              Obx(
                () => RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: '£', style: AppText.semibold25White),
                      TextSpan(
                          text: '${controller.paymentAmount.value.floor()}',
                          style: AppText.semibold50White),
                      TextSpan(
                          text: controller.paymentAmount.value
                              .toStringAsFixed(2)
                              .substring(
                                  controller.paymentAmount.value
                                          .toStringAsFixed(2)
                                          .length -
                                      3,
                                  controller.paymentAmount.value
                                      .toStringAsFixed(2)
                                      .length),
                          style: AppText.semibold25White),
                    ],
                  ),
                ),
              ),
              const CustomNumpad(),
              Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: WhiteButton(
                  title: 'Next',
                  onPressed: () {
                    controller.isTopup.value
                        ? controller.addTransaction()
                        : Get.off(() => ToWhomView(),
                            transition: Transition.leftToRight);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
