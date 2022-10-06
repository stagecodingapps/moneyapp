import 'package:flutter/material.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';

class TotalBalance extends StatelessWidget {
  final double balance;
  const TotalBalance({
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      color: AppColors.pink,
      child: SafeArea(
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'MoneyApp',
                  style: AppText.semibold16White,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: '£', style: AppText.semibold25White),
                      TextSpan(
                          text: '${balance.floor()}',
                          style: AppText.semibold50White),
                      TextSpan(
                          text: balance.toStringAsFixed(2).substring(
                              balance.toStringAsFixed(2).length - 3,
                              balance.toStringAsFixed(2).length),
                          style: AppText.semibold25White),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
