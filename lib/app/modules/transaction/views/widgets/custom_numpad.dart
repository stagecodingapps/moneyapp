import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/app/config/colors.dart';
import 'package:money_app/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:money_app/app/modules/transaction/views/widgets/numpad_button.dart';
import 'package:money_app/app/util/size_util.dart';

class CustomNumpad extends StatelessWidget {
  const CustomNumpad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: calculateWidth(context),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: NumpadButton(
                      title: '1',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '2',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '3',
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: NumpadButton(
                      title: '4',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '5',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '6',
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: NumpadButton(
                      title: '7',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '8',
                    ),
                  ),
                  Expanded(
                    child: NumpadButton(
                      title: '9',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: NumpadButton(
                      title: '.',
                    ),
                  ),
                  const Expanded(
                    child: NumpadButton(
                      title: '0',
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () =>
                          Get.find<TransactionController>().deleteLastDigit(),
                      style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                          Color(0x40FFFFFF),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          size: 40,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
