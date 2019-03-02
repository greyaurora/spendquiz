import 'package:flutter/material.dart';

import '../models/date_ranges.dart';
import 'payment.dart';
import 'type_picker.dart';
import 'amount_field.dart';
import 'amount_button_row.dart';
import 'quiz_result_dialog.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  DateRange range = DateRange.today;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.blueGrey.shade300,
              width: 4,
            ),
          ),
          height: 88,
          child: ListWheelScrollView(
            itemExtent: 48,
            useMagnifier: true,
            children: DateRange.values.map((val) => rangeLabel(val)).toList(),
            onSelectedItemChanged: (int i) {
              if (i == null) {
                range = null;
              } else {
                range = DateRange.values[i];
              }
              setState(() {});
            },
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Text(
              'I spent',
              style: TextStyle(fontSize: 20),
            ),
            AmountField(label: null),
            Row(
              children: <Widget>[
                SizedBox(width: 48),
                Expanded(child: AmountButtonRow(AmountType.dollars)),
                Expanded(child: AmountButtonRow(AmountType.cents)),
                SizedBox(width: 48),
              ],
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'on:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 88,
              child: TypePicker(showAll: true),
            ),
          ],
        ),
        RaisedButton(
          color: Theme
              .of(context)
              .accentColor,
          padding: EdgeInsets.all(16),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext newContext) {
                return QuizResultDialog(
                  amount: Payment
                      .of(context)
                      .amount,
                  type: Payment
                      .of(context)
                      .type,
                  range: range,
                );
              },
            );
          },
          child: Text(
            'Quiz my spend!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
