import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/modules/loan/views/widgets/custom_input_field.dart';

import '../controllers/loan_controller.dart';

class LoanView extends GetView<LoanController> {
  const LoanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              width: double.infinity,
              color: AppColors.pink,
              child: Stack(
                children: [
                  SizedBox(
                    width: 45,
                    child: TextButton(
                      onPressed: () {},
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
                      'Loan Application',
                      textAlign: TextAlign.center,
                      style: AppText.semibold16White,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                'Terms and Conditions',
                style: AppText.semibold23Black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum enim non neque luctus, nec blandit ipsum sagittis. Sed fringilla blandit nibh, sit amet suscipit massa sollicitudin lacinia. Donec cursus, odio sit amet tincidunt sodales, odio nisl hendrerit sem, tempor tincidunt ligula nisl nec ante. Nulla aliquet aliquam justo, ac bibendum orci rhoncus non. Nullam quis ex elementum, pharetra ligula eleifend, convallis nulla. Nulla sit amet nisi viverra, semper nunc eu, posuere dui. Donec at metus ut eros rhoncus vestibulum vitae at lacus. Etiam imperdiet, nulla ac condimentum aliquam, enim lacus fringilla leo, vel hendrerit mi ipsum et ante. Vivamus finibus mauris eget diam sodales, eget efficitur orci laoreet. Sed feugiat odio quis mattis tristique. Mauris sit amet sem mauris.',
                textAlign: TextAlign.justify,
                style: AppText.regular14DarkGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.only(left: 20, right: 20),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    overlayColor: MaterialStatePropertyAll(AppColors.pink20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Accept Terms & Conditions',
                        style: AppText.medium14Black,
                      ),
                      Switch(
                        value: false,
                        onChanged: (val) {},
                        activeColor: AppColors.pink,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
              child: Text(
                'ABOUT YOU',
                style: AppText.semibold14Black,
              ),
            ),
            CustomInputField(
              title: 'Monthly Salary',
              onChanged: (value) {},
            ),
            CustomInputField(
              title: 'Monthly Expenses',
              onChanged: (value) {},
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
              child: Text(
                'LOAN',
                style: AppText.semibold14Black,
              ),
            ),
            CustomInputField(
              title: 'Amount',
              onChanged: (value) {},
            ),
            CustomInputField(
              title: 'Term',
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(AppColors.pink),
                        overlayColor: const MaterialStatePropertyAll(
                          Color(0x70F7F7F7),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Apply for loan',
                          style: AppText.semibold18White,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
