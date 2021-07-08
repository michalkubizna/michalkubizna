part of '../../Screens/HomeScreen.dart';

class _CirclesView extends StatefulWidget {
  @override
  __CirclesViewState createState() => __CirclesViewState();
}

class __CirclesViewState extends State<_CirclesView> {
  Widget _buildButton(Data data, bool isHovered) {
    return Container(
      color: isHovered ? MyColors.purple : Colors.transparent,
      width: 200,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ChildrenUtil().getAllPaddedChildren([
          isHovered ? SizedBox.shrink() : Icon(data.iconData, size: 40),
          Row(
            children: [
              Text(data.title,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      color: isHovered ? Colors.white : MyColors.purple)),
              Icon(
                Icons.arrow_forward_ios,
                color: isHovered ? Colors.white : MyColors.pink,
              )
            ],
          ),
          Text(
            data.description,
            style: TextStyle(color: isHovered ? Colors.white : MyColors.purple),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final datas = [
      Data(
        title: "Ideation & Strategy",
        description:
        "Reach new business opportunities or test your product ideas",
        iconData: Icons.online_prediction,
      ),
      Data(
        title: "Product Design",
        description:
        "Create a beautiful digital product or polish your existingo one",
        iconData: Icons.design_services,
      ),
      Data(
        title: "Web & Mobile",
        description:
        "Stay ahead of the game with tailor-made mobile and web apps",
        iconData: Icons.developer_mode,
      ),
      Data(
          title: "Cloud Services",
          description:
          "Automate your processes and get data-driven business insights",
          iconData: Icons.cloud,
      ),
    ];

    final List<Widget> children = [
      for (var i = 0; i < datas.length; i++)
        SlideAnimationView(
          durationFraction: 0.7,
          length: datas.length,
          milliseconds: 1000,
          i: i,
          child: MouseRegionView(
            buildChild: (isHovered) => AnimatedCrossFade(
                firstChild: _buildButton(datas[i], false),
                secondChild: _buildButton(datas[i], true),
                crossFadeState: isHovered
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200)),
          ),
        )
    ];

    var child;

    if (PlatformUtil().isDesktop(context)) {
      child = Row(
            children: children);
    } else {
      child = Column(
            children: children,
          );
    }

    final List<String> texts = "See what we can do for you".replaceAll(" ", ", ").split(",");

    return Container(
      width: MediaQuery.of(context).size.width,
      color: MyColors.transparentBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ChildrenUtil().getAllPaddedChildren([
          DefaultTextStyle(
            style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 32),
            child: Row(
              children: [for (var i = 0; i < texts.length; i++) SlideAnimationView(
                durationFraction: 0.7,
                length: texts.length,
                milliseconds: 1000,
                i: i,
                child: Text(texts[i]),
              )],
            ),
          ),
          child,
        ], padding: 32),
      ),
    );
  }
}
