import 'package:flutter/material.dart';

import '../models/payment_types.dart';
import 'package:spend_quiz/src/widgets/type_grid_tile.dart';

class TypePicker extends StatelessWidget {
  final bool showAll;

  const TypePicker({Key key, this.showAll = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> options =
        PaymentType.values.map((type) => TypeGridTile(type)).toList();

    if (showAll) options.insert(0, TypeGridTile.all());

    return GridView.count(
      childAspectRatio: 1.0,
      crossAxisCount: showAll ? 1 : 2,
      scrollDirection: Axis.horizontal,
      children: options,
    );
  }
}
