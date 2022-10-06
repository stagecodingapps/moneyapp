import 'package:get/get.dart';
import 'package:money_app/app/modules/transaction/views/widgets/welcome_animation.dart';

import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/loan/bindings/loan_binding.dart';
import '../modules/loan/views/loan_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => const TransactionsView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.LOAN,
      page: () => const LoanView(),
      binding: LoanBinding(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeAnimation(),
    ),
  ];
}
