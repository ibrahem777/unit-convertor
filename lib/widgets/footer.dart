import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  double result;
  FooterWidget(this.result);
  @override
  Widget build(BuildContext context) {
    return Text(result.toStringAsFixed(2));
  }
}