import 'package:flutter/material.dart';

import 'payment.dart';
import '../models/payment_types.dart';

class TypeGridTile extends StatelessWidget {
  final PaymentType type;

  const TypeGridTile(this.type);

  const TypeGridTile.all() : type=null;

  @override
  Widget build(BuildContext context) {
    bool selected = Payment.of(context).type == type;

    return Material(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor
              : Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: FlatButton(
          onPressed: () => Payment.of(context).type = type,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                typeIcon(type),
                color: Colors.white,
              ),
              FittedBox(
                child: Text(
                  typeLabel(type),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
