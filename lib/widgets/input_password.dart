import 'package:flutter/material.dart';
import 'package:gin_finans/models/complexity_model.dart';
import 'package:gin_finans/models/score_model.dart';
import 'package:gin_finans/widgets/button_next.dart';
import 'package:gin_finans/widgets/complexity.dart';
import 'package:gin_finans/widgets/top_content.dart';

class InputPassword extends StatefulWidget {
  final bool showButtonNext;
  final TextEditingController password;
  final Function onPressNext;

  InputPassword({
    required this.showButtonNext,
    required this.password,
    required this.onPressNext,
  });

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _showPassword = false;
  var complexities = [
    ComplexityModel(title: 'a', subtitle: 'Lowercase', validated: false),
    ComplexityModel(title: 'A', subtitle: 'Uppercase', validated: false),
    ComplexityModel(title: '123', subtitle: 'Number', validated: false),
    ComplexityModel(title: '9+', subtitle: 'Characters', validated: false),
  ];

  bool validated = false;
  int score = 0;

  void onPressButton() {
    if (validated) {
      widget.onPressNext();
    }
  }

  String onChangedPassword(String text) {
    bool isIncludeLowercase = text.contains(RegExp(r'[a-z]'));
    bool isIncludeUppercase = text.contains(RegExp(r'[A-Z]'));
    bool isNumber = text.contains(RegExp(r'[0-9]'));
    bool lengthValidate = text.length >= 9;

    setState(() {
      if (isIncludeLowercase) {
        complexities[0].validated = true;
      } else {
        complexities[0].validated = false;
      }

      if (isIncludeUppercase) {
        complexities[1].validated = true;
      } else {
        complexities[1].validated = false;
      }

      if (isNumber) {
        complexities[2].validated = true;
      } else {
        complexities[2].validated = false;
      }

      if (lengthValidate) {
        complexities[3].validated = true;
      } else {
        complexities[3].validated = false;
      }

      var tmpScore = 0;

      for (var i = 0; i < complexities.length; i++) {
        if (complexities[i].validated) tmpScore += 1;
      }

      score = tmpScore;

      if (isIncludeUppercase &&
          isIncludeUppercase &&
          isNumber &&
          lengthValidate) {
        validated = true;
      } else {
        validated = false;
      }
    });

    return text;
  }

  ScoreModel get getScore {
    var result = ScoreModel('Unhandled', Colors.red[200]);
    if (score <= 1) {
      result.text = 'Very Weak';
    } else if (score == 2) {
      result.text = 'Weak';
      result.color = Colors.orange[200];
    } else if (score == 3) {
      result.text = 'Good';
      result.color = Colors.green[200];
    } else if (score == 4) {
      result.text = 'Exelent';
      result.color = Colors.green[300];
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopContent(
                title: 'Create Password',
                subtitle: 'Password will be used to login account',
              ),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                obscureText: !_showPassword,
                onChanged: onChangedPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                  ),
                  // errorText: errorText.isEmpty ? null : errorText,
                ),
                controller: widget.password,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(text: 'Complexity: '),
                    TextSpan(
                      text: getScore.text,
                      style: TextStyle(
                        color: getScore.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...complexities.map((e) {
                    return Expanded(
                      child: Complexity(complexity: e),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
        widget.showButtonNext ? ButtonNext(onPressButton) : Container(),
      ],
    );
  }
}
