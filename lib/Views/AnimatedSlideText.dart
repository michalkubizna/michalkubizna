import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Views/MouserRegionView.dart';

class AnimatedSlideText extends StatefulWidget {
  final String text;
  final bool isCentered;

  AnimatedSlideText({
    @required this.text,
    this.isCentered = false
  });

  @override
  _AnimatedSlideTextState createState() => _AnimatedSlideTextState();
}

class _AnimatedSlideTextState extends State<AnimatedSlideText> {
  @override
  Widget build(BuildContext context) {
    return MouseRegionView(
      buildChild: (isHovered) {
        final Widget child = AnimatedPadding(
          padding: EdgeInsets.only(left: isHovered ? 16 : 0),
          duration: Duration(milliseconds: 200),
          child: Text(widget.text, style: Theme.of(context).textTheme.headline1.copyWith(color: isHovered ? MyColors.pink : MyColors.purple)),
        );

        return widget.isCentered ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: 180,
            child: Center(
              child: child,
            ),
          ),
        ) : child;
      },
    );
  }
}

