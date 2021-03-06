import 'package:flutter/material.dart';

import '../widgets/pagination.dart';
import '../widgets/input_email.dart';

import '../models/page_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<PageModel> pages = [
    PageModel(title: '1'),
    PageModel(title: '2'),
    PageModel(title: '3'),
    PageModel(title: '4'),
  ];
  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    final bool showButtonNext = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size(0.0, 0.0),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Pagination(
              index: -1,
              pages: pages,
            ),
            Expanded(
              child: InputEmail(showButtonNext: showButtonNext),
            ),
          ],
        ),
      ),
    );
  }
}
