import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/AnimatedSlideText.dart';
import 'package:michalkubizna/Views/AppBarButton.dart';
import '../../Provider/ExpansionProvider.dart';
import 'package:provider/provider.dart';

class ExpansionBarView extends StatefulWidget {
  @override
  _ExpansionBarViewState createState() => _ExpansionBarViewState();
}

class _ExpansionBarViewState extends State<ExpansionBarView> {
  bool _isExpansionRegion = false;

  @override
  Widget build(BuildContext context) {
    final ExpansionProvider expansionProvider = context.watch<ExpansionProvider>();

    final bool isButtonRegion = expansionProvider.isButtonRegion;

    final List<String> texts = expansionProvider.texts;

    final bool isDesktop = PlatformUtil().isDesktop(context);

    return MouseRegion(
      onEnter: (PointerEnterEvent pointerEnterEvent) {
        setState(() {
          _isExpansionRegion = true;
        });
      },
      onExit: (PointerExitEvent pointerExitEvent) {
        setState(() {
          _isExpansionRegion = false;
        });
      },
      child: AnimatedContainer(
          color: Colors.white,
          height: ((isButtonRegion || _isExpansionRegion) && isDesktop) ? 80 : 0,
          duration: Duration(
              milliseconds: 200
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (final text in texts) Flexible(
            child: AppBarButton(
                onTap: () {

                },
                child: AnimatedSlideText(text: text, isCentered: true,)),
          )],
        ),
      ),
    );
  }
}
