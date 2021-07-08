import 'package:flutter/material.dart';
import 'package:michalkubizna/MyColors.dart';
import 'package:michalkubizna/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future _future;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _future = precacheImage(AssetImage("images/introduction.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus.unfocus();
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Michal Kubizna',
                theme: ThemeData(
                  iconTheme: IconThemeData(color: MyColors.purple),
                  buttonTheme: ButtonThemeData(buttonColor: MyColors.pink),
                  fontFamily: "Lato",
                  textTheme: TextTheme(
                      headline1: TextStyle(fontSize: 16.0,
                          fontWeight: FontWeight.bold, color: MyColors.purple),
                      bodyText1: TextStyle(color: MyColors.purple)
                  ),
                  backgroundColor: Colors.white,
                  accentColor: Colors.grey[600],
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: HomeScreen()
            ),
          );
        } else {
          return Container(color: Colors.white,);
        }
      },
    );
  }
}

class OK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(MyColors.darkPurple.withOpacity(0.5), BlendMode.srcOver),
        child: Image.asset("images/software_engineer.png", width: 32, height: 32,)
    );
  }
}
