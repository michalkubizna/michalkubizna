import 'package:flutter/material.dart';

class Data {
  final IconData iconData;
  final String title;
  final String description;
  final List<String> texts;
  final double begin;
  final double end;

  Data({
    this.iconData,
    this.title,
    this.description,
    this.texts,
    this.begin,
    this.end,
  });
}