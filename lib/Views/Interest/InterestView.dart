import 'package:flutter/material.dart';

class InterestView extends StatelessWidget {
  final Function buildText;

  InterestView({
    this.buildText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildText(context, "- One of my goals is to win a local tennis league."
        " I try to play tennis as often as I can."),
        buildText(context, "- I've been playing chess since I was a kid. I like to challenge myself and solve complicated chess problems."),
        buildText(context, "- I really enjoy playing a guitar and listen to music. Some of my favorite bands are Nirvana and Foo Fighters."),
        buildText(context, "- I also love MTB riding. "
            "It's a great way for me to improve my fitness.")
      ]
    );
  }
}
