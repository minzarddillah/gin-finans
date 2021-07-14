import 'package:flutter/material.dart';

import './button_next.dart';
import '../screens/create_account.dart';

class InputEmail extends StatelessWidget {
  final emailController = TextEditingController();
  final bool showButtonNext;

  InputEmail({required this.showButtonNext});

  void onPressNext(ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CreateAccount();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
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
                margin: EdgeInsets.only(bottom: 20),
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
                  ),
                  controller: emailController,
                ),
              ),
            ],
          ),
        ),
        showButtonNext ? ButtonNext(() => onPressNext(context)) : Container(),
      ],
    );
  }
}
