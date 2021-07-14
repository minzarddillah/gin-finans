import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:gin_finans/models/page_model.dart';
import 'package:gin_finans/widgets/input_password.dart';
import 'package:gin_finans/widgets/pagination.dart';

class CreateAccount extends StatefulWidget {
  final String email;

  CreateAccount({required this.email});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final List<PageModel> pages = [
    PageModel(title: '1'),
    PageModel(title: '2'),
    PageModel(title: '3'),
    PageModel(title: '4'),
  ];
  var indexPage = 0;
  var passwordController = TextEditingController();

  void onPressPagination(index) {
    setState(() {
      indexPage = index;
    });
  }

  void onPressNext() {
    if (indexPage < pages.length - 1) {
      setState(() {
        indexPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showButtonNext = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Create Account',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        toolbarHeight: 40,
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pagination(
              index: indexPage,
              pages: pages,
              onPressPagination: onPressPagination,
              disabled: false,
            ),
            Expanded(
              child: ConditionalSwitch.single(
                context: context,
                valueBuilder: (BuildContext context) => indexPage,
                caseBuilders: {
                  0: (BuildContext context) => InputPassword(
                        showButtonNext: showButtonNext,
                        password: passwordController,
                        onPressNext: onPressNext,
                      ),
                  1: (BuildContext context) => Text('1'),
                  2: (BuildContext context) => Text('2'),
                  3: (BuildContext context) => Text('3'),
                },
                fallbackBuilder: (BuildContext context) => Text('hello world'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
