import 'package:flutter/material.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/config/text_styles.dart';
import 'package:money_app/app/data/models/transaction_model.dart';

class TileButton extends StatelessWidget {
  final Transaction transaction;
  final Widget icon;
  final Function() onPressed;
  const TileButton({
    Key? key,
    required this.transaction,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.only(left: 25, right: 20),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(AppColors.pink20),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: AppColors.pink,
                // borderRadius: BorderRadius.circular(3.5),
              ),
              child: Center(
                  child: transaction.type == 'Topup'
                      ? const Icon(
                          Icons.add_circle,
                          size: 15,
                          color: Colors.white,
                        )
                      : icon),
            ),
            Expanded(
              child: Text(
                transaction.name!,
                style: AppText.semibold14Black,
              ),
            ),
            transaction.amount != null
                ? RichText(
                    text: TextSpan(children: [
                    TextSpan(
                      text: transaction.type != 'Payment'
                          ? '+${transaction.amount!.floor()}'
                          : '${transaction.amount!.floor()}',
                      style: transaction.type != 'Payment'
                          ? AppText.light22Pink
                          : AppText.light22Black,
                    ),
                    TextSpan(
                      text: transaction.amount!.toStringAsFixed(2).substring(
                          transaction.amount!.toStringAsFixed(2).length - 3,
                          transaction.amount!.toStringAsFixed(2).length),
                      style: transaction.type != 'Payment'
                          ? AppText.light16Pink
                          : AppText.light16Black,
                    )
                  ]))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
