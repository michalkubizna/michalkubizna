import 'package:flutter/material.dart';

class GridUtil {
  List<Widget> getGrid(BuildContext context, List<Widget> children) {
    return [for (final child in children) ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth:
            MediaQuery.of(context).size.width / 4),
        child: child)];
  }
}