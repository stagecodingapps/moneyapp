import 'package:flutter/material.dart';

double calculateWidth(BuildContext context) {
  if (MediaQuery.of(context).size.width > 600) {
    return 600;
  }
  return MediaQuery.of(context).size.width;
}
