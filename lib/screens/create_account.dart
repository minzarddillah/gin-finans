import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:gin_finans/models/page_model.dart';
import 'package:gin_finans/widgets/input_password.dart';
import 'package:gin_finans/widgets/input_personal_information.dart';
import 'package:gin_finans/widgets/input_schedule.dart';
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
  var _indexPage = 0;

  var _passwordController = TextEditingController();
  String? _goalValue = '- Choose Option -';
  String? _monthlyIncomeValue = '- Choose Option -';
  String? _monthlyExpenceValue = '- Choose Option -';
  DateTime? _selectedDate;
  TimeOfDay _selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool alreadySelectedTime = false;

  void _onPressNext() {
    if (_indexPage < pages.length - 1) {
      setState(() {
        _indexPage++;
      });
    }
  }

  void _onChangeGoal(value) {
    setState(() {
      _goalValue = value!;
    });
  }

  void _onChangeMonthlyIncome(value) {
    setState(() {
      _monthlyIncomeValue = value;
    });
  }

  void _onChangeMonthlyExpence(value) {
    setState(() {
      _monthlyExpenceValue = value;
    });
  }

  void _onChangeDatePicker(DateTime value) {
    setState(() {
      _selectedDate = value;
    });
  }

  void _onChangeTimePicker(TimeOfDay value) {
    setState(() {
      _selectedTime = value;
      if (!alreadySelectedTime) {
        alreadySelectedTime = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool _showButtonNext = MediaQuery.of(context).viewInsets.bottom == 0;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Pagination(
              index: _indexPage,
              pages: pages,
            ),
            Expanded(
              child: ConditionalSwitch.single(
                context: context,
                valueBuilder: (BuildContext context) => _indexPage,
                caseBuilders: {
                  0: (BuildContext context) => InputPassword(
                        showButtonNext: _showButtonNext,
                        password: _passwordController,
                        onPressNext: _onPressNext,
                      ),
                  1: (BuildContext context) => InputPersonalInformation(
                        showButtonNext: _showButtonNext,
                        onPressNext: _onPressNext,
                        goalValue: _goalValue,
                        monthlyIncomeValue: _monthlyIncomeValue,
                        monthlyExpenceValue: _monthlyExpenceValue,
                        onChangeGoal: _onChangeGoal,
                        onChangeMonthlyIncome: _onChangeMonthlyIncome,
                        onChangeMonthlyExpence: _onChangeMonthlyExpence,
                      ),
                  2: (BuildContext context) => InputScbedule(
                        showButtonNext: _showButtonNext,
                        onPressNext: _onPressNext,
                        selectedDate: _selectedDate,
                        selectedTime: _selectedTime,
                        alreadySelectedTime: alreadySelectedTime,
                        onChangeDatePicker: _onChangeDatePicker,
                        onChangeTimePicker: _onChangeTimePicker,
                      ),
                  3: (BuildContext context) => Text('3'),
                },
                fallbackBuilder: (BuildContext context) => Text('Unexpected'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
