import 'dart:developer';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:money_app/app/data/models/transaction_model.dart';
import 'package:money_app/app/modules/transaction/views/transaction_details_view.dart';
import 'package:money_app/app/modules/transaction/views/transaction_view.dart';

class TransactionController extends GetxController {
  RxDouble balance = 150.25.obs;
  Rx<Transaction> selectedTransaction = Transaction().obs;
  RxBool isTopup = false.obs;
  RxBool isRepeatingPayment = false.obs;
  RxDouble paymentAmount = 0.0.obs;
  String paymentAmountString = '';
  String transactionName = '';
  RxList<Transaction> transactions = <Transaction>[].obs;

  void toggleIsRepeatingPayment(bool? value) {
    isRepeatingPayment.value = value ?? !isRepeatingPayment.value;
  }

  void repeatingPayment() {
    if (isRepeatingPayment.value) {
      transactions.add(
        Transaction(
          name: selectedTransaction.value.name,
          amount: selectedTransaction.value.amount,
          type: 'Payment',
          id: getRandomString(30),
          createdAt: DateTime.now(),
        ),
      );
      balance.value -= selectedTransaction.value.amount!;
      isRepeatingPayment.value = false;
    }
  }

  void splitTheBill() {
    var amount = selectedTransaction.value.amount! / 2;
    transactions
        .firstWhere(
            (transaction) => transaction.id! == selectedTransaction.value.id!)
        .amount = amount;
    transactions.add(
      Transaction(
        name: 'Top Up',
        amount: amount,
        createdAt: DateTime.now(),
        id: getRandomString(30),
        type: 'Topup',
      ),
    );
    update(['amount']);
    selectedTransaction.value = selectedTransaction.value..amount = amount;
    balance.value += amount;
  }

  void selectTransaction(Transaction transaction) {
    selectedTransaction.value = transaction;
    Get.to(
      () => TransactionDetailsView(),
      transition: Transition.leftToRight,
    );
  }

  void addTransaction({String? title, double? amount}) {
    if (!isTopup.value) {
      transactions.add(
        Transaction(
          name: title ?? transactionName,
          amount: amount ?? paymentAmount.value,
          createdAt: DateTime.now(),
          id: getRandomString(30),
          type: title ?? 'Payment',
        ),
      );
      balance.value -= paymentAmount.value;
      paymentAmount.value = 0;
      paymentAmountString = '0';
      Get.back(result: const TransactionsView());
      return;
    }
    transactions.add(
      Transaction(
        name: 'Top Up',
        amount: paymentAmount.value,
        createdAt: DateTime.now(),
        id: getRandomString(30),
        type: 'Topup',
      ),
    );
    balance.value += paymentAmount.value;
    paymentAmountString = '0';
    paymentAmount.value = 0;
    isTopup.value = false;
    Get.back();
  }

  void setTransactionName(String value) => transactionName = value;

  void enterPaymentAmount(String digit) {
    if (digit == '.' && paymentAmountString.contains(digit)) {
      return;
    }
    if (paymentAmountString.length > 3 &&
        !paymentAmountString
            .substring(paymentAmountString.length - 2)
            .contains('.') &&
        paymentAmountString.contains('.')) {
      return;
    }
    if (paymentAmountString.length > 10) {
      return;
    }
    paymentAmountString = '$paymentAmountString$digit';
    paymentAmount.value = double.parse(paymentAmountString);
    log(paymentAmountString);
    log(paymentAmount.value.toString());
  }

  void deleteLastDigit() {
    if (paymentAmountString.length == 1) {
      paymentAmount.value = 0.0;
      paymentAmountString = '';
      return;
    }
    if (paymentAmountString.length < 2) {
      return;
    }
    if (paymentAmountString.substring(paymentAmountString.length - 1) == '.') {
      paymentAmountString =
          paymentAmountString.substring(0, paymentAmountString.length - 1);
    }
    paymentAmountString =
        paymentAmountString.substring(0, paymentAmountString.length - 1);

    paymentAmount.value = double.tryParse(paymentAmountString) ?? 0;
    log(paymentAmountString);
    log(paymentAmount.value.toString());
  }

  String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    math.Random rnd = math.Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  void onInit() {
    transactions.addAll([
      Transaction(
        name: 'transaction1',
        amount: 120.2,
        createdAt: DateTime(2022, 10, 4),
        id: 'abcasdaasd',
        type: 'Payment',
      ),
      Transaction(
        name: 'transaction2',
        amount: 120.2,
        createdAt: DateTime(2022, 10, 5),
        id: 'abcaasdasd',
        type: 'Payment',
      ),
      Transaction(
        name: 'transaction3',
        amount: 120.2,
        createdAt: DateTime.now(),
        id: 'absdgsdc',
        type: 'Payment',
      ),
      Transaction(
        name: 'transaction4',
        amount: 120.2,
        createdAt: DateTime.now(),
        id: 'aasdsabc',
        type: 'Payment',
      ),
    ]);
    super.onInit();
  }
}
