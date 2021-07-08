import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Views/AppBarButton.dart';
import 'package:michalkubizna/Provider/ExpansionProvider.dart';
import 'package:provider/provider.dart';

class RotatedButtonView extends StatefulWidget {
  final String text;
  final List<String> texts;
  final GlobalKey globalKey;

  RotatedButtonView(
      {this.text,
        this.texts,
        this.globalKey
      });

  @override
  _RotatedButtonViewState createState() => _RotatedButtonViewState();
}

class _RotatedButtonViewState extends State<RotatedButtonView> {
  bool _isButtonRegion = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent pointerEnterEvent) {
        setState(() {
          _isButtonRegion = true;
        });

        context.read<ExpansionProvider>().expand(widget.texts, _isButtonRegion);
      },
      onExit: (PointerExitEvent pointerExitEvent) {
        setState(() {
          _isButtonRegion = false;
        });

        context.read<ExpansionProvider>().expand(widget.texts, _isButtonRegion);
      },
      child: AppBarButton(
        onTap: () {

        },
        child: Row(
          children: [
            Text(widget.text,
                style: Theme.of(context).textTheme.headline1.copyWith(
                  color: _isButtonRegion ? MyColors.pink : MyColors.purple,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TweenAnimationBuilder<double>(
                  tween: _isButtonRegion
                      ? Tween(begin: 90, end: 0)
                      : Tween(begin: 0, end: 90),
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: _isButtonRegion ? MyColors.pink : MyColors.purple,
                  ),
                  builder: (context, double angle, Widget child) {
                    return Transform.rotate(
                      angle: angle * pi / 180,
                      child: child,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
