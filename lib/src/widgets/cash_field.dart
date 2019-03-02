import 'package:flutter/material.dart';

import 'payment.dart';

class CashField extends StatefulWidget {
  final AmountType fieldType;

  CashField(this.fieldType);

  @override
  _CashFieldState createState() => _CashFieldState();
}

class _CashFieldState extends State<CashField> {
  TextEditingController _controller;
  FocusNode _focus = FocusNode();

  void _update(String val) {
    switch (widget.fieldType) {
      case AmountType.dollars:
        Payment.of(context).dollars = int.parse(val);
        break;
      case AmountType.cents:
        Payment.of(context).cents = int.parse(val);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _focus..addListener(() {
      if (!_focus.hasFocus) {
        _update(_controller.text);
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller = TextEditingController(
        text: widget.fieldType == AmountType.dollars ? '${Payment.of(context).dollars}' : '${Payment.of(context).cents}',
      ),
      keyboardType: TextInputType.number,
      focusNode: _focus,
      style: Theme.of(context).textTheme.display3,
      textAlign: TextAlign.center,
    );
  }
}