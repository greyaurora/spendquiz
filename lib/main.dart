import 'package:flutter/material.dart';

import 'src/theme/lib.dart';
import 'src/widgets/payment.dart';
import 'src/widgets/screen_layout.dart';

void main() => runApp(SpendQuiz());

class SpendQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Quiz!',
      theme: mainTheme,
      home: Payment(child: Main()),
    );
  }
}
