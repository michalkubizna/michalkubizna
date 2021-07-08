import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class _IntroductionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonView(
          onPressed: () {
            launch("https://github.com/michalkubizna");
          },
          text: "GitHub",
          color: Colors.black
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonView(
                  onPressed: () {
                    launch("https://apps.apple.com/us/developer/michal-kubizna/id1410205131");
                  },
                  text: "App Store",
                  color: Colors.blue
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ButtonView(
                    onPressed: () {
                      launch("https://play.google.com/store/apps/developer?id=Michal+Kubizna");
                    },
                    text: "Google Play",
                    color: Colors.green
                )
            )
          ]
      ),
    );
  }
}
