import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../models/payment_types.dart';

const _paymentTable = 'payments.db';

Future<Database> openPaymentTable() async {
  String dbPath = await getDatabasesPath();
  Database db = await openDatabase('$dbPath$_paymentTable', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute('''
        CREATE TABLE payment(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          amount INTEGER NOT NULL,
          type INTEGER NOT NULL,
          paid_at INTEGER NOT NULL
        );
      ''');
  });

  return db;
}

Future savePayment({
  @required double amount,
  @required PaymentType type,
}) async {
  Database db = await openPaymentTable();

  await db.insert('payment', <String, int>{
    'amount': (amount * 100).truncate(),
    'type': type.index,
    'paid_at': DateTime.now().millisecondsSinceEpoch,
  });
}

Future<double> getPaymentTotal({
  @required int start,
  @required int end,
  int type,
}) async {
  Database db = await openPaymentTable();

  String query = 'SELECT sum(amount) as total FROM payment WHERE paid_at > $start AND paid_at < $end';

  if (type is int)
    query = '$query AND type = $type';

  List<Map<String,dynamic>> result = await db.rawQuery(query);

  return (result.first['total'] ?? 0) / 100;
}