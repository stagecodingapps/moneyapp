import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/data/models/transaction_model.dart';
import 'package:money_app/app/modules/transaction/views/enter_amount_view.dart';
import 'package:money_app/app/modules/transaction/views/widgets/custom_icon_button.dart';
import 'package:money_app/app/modules/transaction/views/widgets/tile_button.dart';
import 'package:money_app/app/modules/transaction/views/widgets/total_balance.dart';
import 'package:money_app/app/routes/app_pages.dart';
import 'package:money_app/app/util/date_time.dart';

import '../controllers/transaction_controller.dart';

class TransactionsView extends GetView<TransactionController> {
  const TransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => TotalBalance(
                    balance: controller.balance.value,
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 65, left: 20),
                child: Text(
                  'Recent Activity',
                  style: AppText.semibold14DarkGrey,
                ),
              ),
              Expanded(
                child: GetX<TransactionController>(builder: (_) {
                  List<Transaction> transactions =
                      controller.transactions.value;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Text(
                                getFormatedDate(
                                    controller.transactions.last.createdAt!),
                                style: AppText.semibold10Grey,
                              ),
                            ),
                            TileButton(
                              icon: Image.asset(
                                'assets/images/bag.png',
                                width: 12,
                                height: 13.3,
                              ),
                              transaction: controller.transactions.last,
                              onPressed: () => controller.selectTransaction(
                                  controller.transactions.last),
                            ),
                          ],
                        );
                      }
                      var reverseIndex = transactions.length - index;
                      final transaction = transactions[reverseIndex - 1];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: (dateFormat.format(
                                    transactions[reverseIndex].createdAt!) !=
                                dateFormat.format(
                                    transactions[reverseIndex - 1].createdAt!)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Text(
                                getFormatedDate(transaction.createdAt!),
                                style: AppText.semibold10Grey,
                              ),
                            ),
                          ),
                          TileButton(
                            transaction: transaction,
                            icon: Image.asset(
                              'assets/images/bag.png',
                              width: 12,
                              height: 13.3,
                            ),
                            onPressed: () =>
                                controller.selectTransaction(transaction),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 20,
              top: MediaQuery.of(context).size.height / 3 - 50,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x25000000),
                  offset: Offset(0, 2),
                  blurRadius: 8,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  title: 'Pay',
                  icon: Image.asset(
                    'assets/images/phone_icon.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    controller.isTopup.value = false;
                    Get.to(
                      () => EnterAmountView(),
                      transition: Transition.downToUp,
                    );
                  },
                ),
                CustomIconButton(
                  title: 'Top up',
                  icon: Image.asset(
                    'assets/images/wallet_icon.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    controller.isTopup.value = true;
                    Get.to(
                      () => EnterAmountView(),
                      transition: Transition.downToUp,
                    );
                  },
                ),
                CustomIconButton(
                  title: 'Loan',
                  icon: Image.asset(
                    'assets/images/loan_icon.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.LOAN);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
