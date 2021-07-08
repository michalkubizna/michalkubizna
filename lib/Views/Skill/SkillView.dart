import 'package:flutter/material.dart';

class SkillView extends StatelessWidget {
  final Function buildText;

  SkillView({
    this.buildText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildText(context, "- Skills in Flutter and Firebase empower me to deliver high quality apps."),
        buildText(context, "- Very good knowledge in writing dart on the front-end (Flutter) and Type Script on the back-end (Firebase Cloud Functions)."),
        buildText(context, "- Vast experience working wih Flutter, Firebase, Algolia, Elastic Search, Mysql, SQLite"),
        buildText(context, "- Comfortable prototyping and designing in Sketch."),
        buildText(context, "- Using Git and GitHub for version control.")
      ]
    );
  }
}
