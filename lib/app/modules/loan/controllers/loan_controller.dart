import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/data/models/loan_decision_enum.dart';
import 'package:money_app/app/data/services/loan_service.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';

class LoanController extends GetxController {
  final transactionController = Get.find<TransactionController>();
  late double salary;
  late double expenses;
  late double loanAmount;
  late double term;
  LoanDecision decision = LoanDecision.NO_DECISION;
  RxBool termsAndService = false.obs;

  void toggleTermAndService(bool? value) =>
      termsAndService.value = value ?? !termsAndService.value;

  void setSalary(String value) => salary = double.tryParse(value) ?? 0;

  void setExpenses(String value) => expenses = double.tryParse(value) ?? 0;

  void setLoanAmount(String value) => loanAmount = double.tryParse(value) ?? 0;

  void setTerm(String value) => term = double.tryParse(value) ?? 0;

  void applyForLoan() async {
    if (decision != LoanDecision.NO_DECISION) {
      await showCustomDialog(
          "Ooopsss, you applied before. Wait for notification from us");
      return;
    }
    if (!termsAndService.value) {
      Get.snackbar(
        'To procceed',
        'Please agree to the Terms And Conditions',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.zero,
        backgroundColor: Colors.white,
        colorText: AppColors.pink,
        duration: const Duration(seconds: 5),
      );
      return;
    }
    decision = await LoanService.isLoanApproved(
      balance: transactionController.balance.value,
      salary: salary,
      expenses: expenses,
      loanAmount: loanAmount,
      term: term,
    );

    if (decision != LoanDecision.APPROVED) {
      await showCustomDialog(
          "Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis. ");
    }

    if (decision == LoanDecision.APPROVED) {
      await showCustomDialog(
          "Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!");

      transactionController.addTransaction(title: 'Loan', amount: loanAmount);
      transactionController.balance.value += loanAmount;
    }
  }

  Future<dynamic> showCustomDialog(String message) {
    return Get.dialog(
      Dialog(
        backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppText.semibold16White,
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    salary = 0;
    expenses = 0;
    loanAmount = 0;
    term = 0;
    super.onInit();
  }
}
