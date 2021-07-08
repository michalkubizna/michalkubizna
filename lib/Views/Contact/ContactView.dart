import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:michalkubizna/Views/Description/DescriptionView.dart';

class ContactView extends StatelessWidget {
  ContactView({
    Key key
  }) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  
  final HttpsCallable _callable = FirebaseFunctions.instance.httpsCallable(
      "sendEmail"
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DescriptionView(
          title: "Looking for an experienced developer?",
          description: "Tell me about your project.",
          child: Column(
              children: ChildrenUtil().getAllPaddedChildren([
                TextFieldView(label: "Your name", controller: _nameController),
                TextFieldView(label: "Your email", controller: _emailController),
                TextFieldView(label: "Your message", controller: _messageController),
                ButtonView(color: Colors.blue, text: "Send", onPressed: () async {
                  try {
                    await _callable.call({
                      "name": _nameController.text,
                      "email": _emailController.text,
                      "subject": _emailController.text,
                      "message": _messageController.text
                    });

                    _nameController.text = "";

                    _emailController.text = "";

                    _messageController.text = "";

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Email successfully sent"),
                              actions: [
                                FlatButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text("OK"))
                              ]
                          );
                        }
                    );
                  } catch (error) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("An error ocurred. Please try again later"),
                              actions: [
                                FlatButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text("OK"))
                              ]
                          );
                        }
                    );
                  }
                })
              ])
          ),
      ),
    );
  }
}
