import 'package:flutter/material.dart';

enum PaymentType {
  Groceries,
  Bills,
  Snacks,
  Meals,
  Games,
  Travel,
  Other,
}

IconData typeIcon(PaymentType type) {
  IconData icon;

  switch (type) {
    case PaymentType.Groceries:
      icon = Icons.shopping_cart;
      break;
    case PaymentType.Bills:
      icon = Icons.account_balance;
      break;
    case PaymentType.Snacks:
      icon = Icons.local_cafe;
      break;
    case PaymentType.Meals:
      icon = Icons.fastfood;
      break;
    case PaymentType.Games:
      icon = Icons.videogame_asset;
      break;
    case PaymentType.Travel:
      icon = Icons.directions_car;
      break;
    case PaymentType.Other:
      icon = Icons.monetization_on;
      break;
    default:
      icon = Icons.account_balance_wallet;
      break;
  }

  return icon;
}

String typeLabel(PaymentType type) {
  if (type == null) return 'Everything!';
  return type.toString().split('.')[1].replaceAll('_', '\n');
}
