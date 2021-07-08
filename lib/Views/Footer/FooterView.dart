import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(height: 2.0, color: Colors.grey[600]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text("Copyright © Michal Kubizna 2020", textAlign: TextAlign.center),
          )
        ]
    );
  }
}
