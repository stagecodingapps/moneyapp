import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/data/models/transaction_model.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:money_app/app/modules/transaction/views/widgets/tile_button.dart';

class TransactionDetailsView extends StatelessWidget {
  TransactionDetailsView({Key? key}) : super(key: key);
  final controller = Get.find<TransactionController>();
  final DateFormat dateFormat = DateFormat('dd MMMM yyyy hh:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              height: 44,
              width: double.infinity,
              padding: EdgeInsets.zero,
              color: AppColors.pink,
              child: Stack(
                children: [
                  SizedBox(
                    width: 45,
                    child: TextButton(
                      onPressed: () {
                        controller.repeatingPayment();
                        Get.back();
                      },
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          overlayColor:
                              MaterialStatePropertyAll(Color(0x60FFFFFF))),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: AppColors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'MoneyApp',
                      textAlign: TextAlign.center,
                      style: AppText.semibold16White,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 15, right: 15, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(3.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/bag.png',
                              width: 38,
                            ),
                          ),
                        ),
                        GetBuilder<TransactionController>(
                          id: 'amount',
                          builder: (_) {
                            var amount =
                                controller.selectedTransaction.value.amount!;

                            return RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '${amount.floor()}',
                                style: AppText.light37Black,
                              ),
                              TextSpan(
                                text: amount.toStringAsFixed(2).substring(
                                    amount.toStringAsFixed(2).length - 3,
                                    amount.toStringAsFixed(2).length),
                                style: AppText.light26Black,
                              )
                            ]));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.selectedTransaction.value.name ?? '',
                      style: AppText.semibold23Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 45),
                    child: Text(
                      dateFormat.format(
                          controller.selectedTransaction.value.createdAt!),
                      style: AppText.semibold10Grey,
                    ),
                  ),
                  TileButton(
                    onPressed: () {},
                    transaction: Transaction(name: 'Add receipt'),
                    icon: Image.asset(
                      'assets/images/receipt.png',
                      width: 12,
                    ),
                  ),
                  Visibility(
                    visible:
                        controller.selectedTransaction.value.type == 'Payment',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 55, bottom: 5),
                          child: Text(
                            'SHARE THE COST',
                            style: AppText.semibold14Black,
                          ),
                        ),
                        TileButton(
                          onPressed: () => controller.splitTheBill(),
                          transaction: Transaction(name: 'Split this bill'),
                          icon: Image.asset(
                            'assets/images/split.png',
                            width: 14,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 30, bottom: 5),
                          child: Text(
                            'SUBSCRIPTION',
                            style: AppText.semibold14Black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () =>
                                controller.toggleIsRepeatingPayment(null),
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.only(left: 25, right: 20),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(AppColors.pink20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Repeating Payment',
                                  style: AppText.semibold14Black,
                                ),
                                Obx(
                                  () => Switch(
                                    value: controller.isRepeatingPayment.value,
                                    onChanged: (value) => controller
                                        .toggleIsRepeatingPayment(value),
                                    activeColor: AppColors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, bottom: 40),
                    child: SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () => Get.snackbar(
                          'Stay put!',
                          'Help is on the way.',
                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                          colorText: AppColors.pink,
                          duration: const Duration(seconds: 5),
                        ),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.only(left: 25, right: 20),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          overlayColor:
                              MaterialStatePropertyAll(AppColors.pink20),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Something wrong? Get help',
                              style: AppText.semibold14Red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        var transaction = controller.selectedTransaction.value;
                        return Text(
                          'Transaction ID ${transaction.id}\n${transaction.name} - Merchant ID #1245',
                          textAlign: TextAlign.center,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
