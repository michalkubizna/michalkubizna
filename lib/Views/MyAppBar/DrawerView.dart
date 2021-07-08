import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Models/Data.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Views/AnimatedSlideText.dart';
import 'package:michalkubizna/Views/EstimateProjectButton.dart';
import 'package:michalkubizna/Globals/Datas.dart';

class DrawerView extends StatefulWidget {
  final bool isExpanded;

  DrawerView({
    @required this.isExpanded,
  });

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return SizeTransition(child: child, sizeFactor: animation);
  }

  AnimatedSwitcherTransitionBuilder _builder;

  UniqueKey _uniqueKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _builder = _transitionBuilder;

    _uniqueKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: _builder,
      duration: Duration(milliseconds: 200),
      child: widget.isExpanded && !PlatformUtil().isDesktop(context) ? Container(
        key: _uniqueKey,
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: ChildrenUtil().getAllPaddedChildren([
            Column(
              children:
              ChildrenUtil().getDividedChildren([for (final data in datas) _ListTileView(data: data,)], color: MyColors.lightBlue),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: EstimateProjectButton(),
              ),
            )
          ]),
        ),
      ) : Container(
        height: 0,
      ),
    );
  }
}

class _ListTileView extends StatelessWidget {
  final Data data;

  _ListTileView({
    this.data
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionView(
      color: MyColors.purple,
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(data.title, style: Theme.of(context).textTheme.headline1,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final text in data.texts) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: AnimatedSlideText(text: text),
        )],
      ),
    );
  }
}

