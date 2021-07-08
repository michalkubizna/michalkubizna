import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/Interest/InterestView.dart';
import 'package:michalkubizna/Views/Skill/SkillView.dart';

class SkillAndInterestView extends StatefulWidget {
  @override
  _SkillAndInterestViewState createState() => _SkillAndInterestViewState();
}

class _SkillAndInterestViewState extends State<SkillAndInterestView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          text,
          textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).accentColor,
          fontSize: 18.0)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Function child = (List<Widget> children) =>
    PlatformUtil().isDesktop(context)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: children)
        :  Column(children: children);

    final double width = PlatformUtil().isDesktop(context) ? MediaQuery.of(context).size.width / 3 : MediaQuery.of(context).size.width;

    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.all(16.0),
      child: child([
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonView(contentColor: _selectedIndex == 0 ? Colors.white : Colors.black, color: _selectedIndex == 0 ? Colors.blue : Colors.white, iconData: Icons.build, text: "Skills", onPressed: () {
                          _onItemTapped(0);
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonView(contentColor: _selectedIndex == 1 ? Colors.white : Colors.black, color: _selectedIndex == 1 ? Colors.blue : Colors.white, iconData: Icons.favorite, text: "Interests", onPressed: () {
                          _onItemTapped(1);
                        }),
                      )
                    ]
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: width),
                  child: IndexedStack(
                      index: _selectedIndex,
                      children: [
                        SkillView(buildText: _buildText),
                        InterestView(buildText: _buildText)
                      ]
                  ),
                )
              ]
          ),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Image.asset("images/work.png")
        )
      ])
    );
  }
}
