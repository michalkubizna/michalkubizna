import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class DescriptionView extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;

  DescriptionView(
      {this.child = const SizedBox.shrink(), this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final double width = PlatformUtil().isDesktop(context)
        ? MediaQuery.of(context).size.width / 2
        : MediaQuery.of(context).size.width;

    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ChildrenUtil().getAllPaddedChildren([
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
          Text(description,
              style: TextStyle(fontSize: 20.0)),
          child
        ], padding: 24)));
  }
}
