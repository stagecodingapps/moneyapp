import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:money_app/app/data/models/loan_decision_enum.dart';

class LoanService {
  static bool didApply = false;

  static Future<int> httpGetRandomNumber() async {
    var response = await http.get(Uri.parse(
        'http://www.randomnumberapi.com/api/v1.0/random?min=1&max=100&count=1'));
    var json = jsonDecode(response.body);
    log(json[0].toString());
    return json[0];
  }

  static Future<LoanDecision> isLoanApproved({
    required double balance,
    required double salary,
    required double expenses,
    required double loanAmount,
    required double term,
  }) async {
    if (didApply) {
      return LoanDecision.DECLINED;
    }
    final chance = await httpGetRandomNumber();
    if (chance <= 50) {
      return LoanDecision.NO_DECISION;
    }
    if (balance < 1000) {
      return LoanDecision.NO_DECISION;
    }
    if (salary < 1000) {
      didApply = true;
      return LoanDecision.DECLINED;
    }
    if (expenses > salary / 3) {
      didApply = true;
      return LoanDecision.DECLINED;
    }
    if ((loanAmount / term) > salary / 3) {
      didApply = true;
      return LoanDecision.DECLINED;
    }
    didApply = true;
    return LoanDecision.APPROVED;
  }
}
