import 'package:flutter/material.dart';

import './button_next.dart';
import '../screens/create_account.dart';

class InputEmail extends StatefulWidget {
  final bool showButtonNext;

  InputEmail({required this.showButtonNext});

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final emailController = TextEditingController();
  String errorText = '';

  bool isValidEmail(text) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }

  void onPressNext(ctx) {
    var text = emailController.text;
    var tmpError = '';

    if (text.isEmpty) {
      tmpError = 'Email harus diisi';
    } else if (!isValidEmail(text)) {
      tmpError = 'Format email salah';
    } else {
      tmpError = '';
    }

    setState(() {
      errorText = tmpError;
    });

    if (tmpError.isEmpty) {
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (_) {
            return CreateAccount(email: text);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Welcome to\nGIN'),
                      TextSpan(
                          text: ' Finans',
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Welcome to The Bank of The Future. Manage and track your accounts on the go.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                    errorText: errorText.isEmpty ? null : errorText,
                  ),
                  controller: emailController,
                ),
              ),
            ],
          ),
        ),
        widget.showButtonNext
            ? ButtonNext(() => onPressNext(context))
            : Container(),
      ],
    );
  }
}
