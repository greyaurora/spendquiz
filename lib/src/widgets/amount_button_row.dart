import 'dart:math';

import 'package:flutter/material.dart';

import 'payment.dart';

class AmountButtonRow extends StatelessWidget {
  final AmountType type;

  const AmountButtonRow(this.type, {Key key}) : super(key: key);

  void add(BuildContext context) {
    switch (type) {
      case AmountType.dollars:
        Payment.of(context).dollars += 1;
        break;
      case AmountType.cents:
        Payment.of(context).cents = min(99, Payment.of(context).cents + 10);
        break;
    }

    FocusScope.of(context).requestFocus(FocusNode());
  }

  void sub(BuildContext context) {
    switch (type) {
      case AmountType.dollars:
        Payment.of(context).dollars -= 1;
        break;
      case AmountType.cents:
        Payment.of(context).cents = max(0, Payment.of(context).cents - 10);
        break;
    }

    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              shape: CircleBorder(),
              color: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () => add(context),
              ),
            ),
          ),
          Expanded(
            child: Material(
              shape: CircleBorder(),
              color: Colors.blueGrey.shade300,
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: () => sub(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
