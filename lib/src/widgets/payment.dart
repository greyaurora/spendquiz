import 'package:flutter/material.dart';

import '../models/payment_types.dart';
import '../utils/db.dart';

enum AmountType { dollars, cents }

class Payment extends StatefulWidget {
  final Widget child;

  Payment({this.child});

  @override
  _PaymentState createState() => _PaymentState();

  static _PaymentState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_Payment) as _Payment).data;
  }
}

class _PaymentState extends State<Payment> {
  double get amount => dollars + cents / 100;

  int _dollars = 0;

  int get dollars => _dollars;

  set dollars(int val) => setState(() => _dollars = val);

  int _cents = 0;

  int get cents => _cents;

  set cents(int val) {
    while (val > 99) {
      _dollars += 1;
      val -= 100;
    }

    setState(() => _cents = val);
  }

  PaymentType _type;

  PaymentType get type => _type;

  set type(PaymentType type) => setState(() => _type = type);

  void resetAmount() {
    dollars = 0;
    cents = 0;
  }

  void reset() {
    resetAmount();
    _type = null;
  }

  Future save() async {
    await savePayment(amount: amount, type: type);
    reset();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: StadiumBorder(
            side: BorderSide(color: Colors.blueGrey, width: 4),
          ),
          content: Text(
            'Spent!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.w700,
              color: Colors.blueGrey,
            ),
          ),
        );
      },
    );

    return;
  }

  bool get isValid => (type != null && amount > 0);

  @override
  Widget build(BuildContext context) {
    return _Payment(
      data: this,
      child: widget.child,
    );
  }
}

class _Payment extends InheritedWidget {
  final _PaymentState data;

  _Payment({Key key, this.data, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_Payment old) => true;
}
