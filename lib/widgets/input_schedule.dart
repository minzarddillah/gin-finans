import 'package:flutter/material.dart';
import 'package:gin_finans/widgets/button_next.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

import 'package:gin_finans/widgets/dropdown_inkwell.dart';
import 'package:gin_finans/widgets/top_content.dart';

class InputScbedule extends StatefulWidget {
  final bool showButtonNext;
  final Function onPressNext;
  final DateTime? selectedDate;
  final TimeOfDay selectedTime;
  final bool alreadySelectedTime;
  final void Function(DateTime) onChangeDatePicker;
  final void Function(TimeOfDay) onChangeTimePicker;

  InputScbedule({
    required this.showButtonNext,
    required this.onPressNext,
    required this.selectedDate,
    required this.selectedTime,
    required this.alreadySelectedTime,
    required this.onChangeDatePicker,
    required this.onChangeTimePicker,
  });
  @override
  _InputScbeduleState createState() => _InputScbeduleState();
}

class _InputScbeduleState extends State<InputScbedule>
    with TickerProviderStateMixin {
  AnimationController? _breathingController;
  var _breathe = 0.0;

  @override
  void initState() {
    super.initState();

    _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _breathingController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController!.forward();
      }
    });

    _breathingController!.addListener(() {
      setState(() {
        _breathe = _breathingController!.value;
      });
    });
    _breathingController!.forward();
  }

  void _onTapDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((value) {
      if (value != null) {
        widget.onChangeDatePicker(value);
      }
    });
  }

  void _onTapTimePicker() {
    showTimePicker(
      context: context,
      initialTime: widget.selectedTime,
    ).then((picked) {
      if (picked != null) {
        widget.onChangeTimePicker(picked);
      }
    });
  }

  void onPressButton() {
    widget.onPressNext();
  }

  @override
  Widget build(BuildContext context) {
    final double size = 9.0 - 4.0 * _breathe;

    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: size, color: Colors.white38),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.blue,
                  ),
                ),
              ),
              TopContent(
                title: 'Schedule Video Call',
                subtitle:
                    'Choose the date and the time that you preferred, we will send a link via email to make a video call on the scheduled date and time.',
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: DropdownInkwell(
                  label: 'Date',
                  value: widget.selectedDate == null
                      ? '- Choose Date -'
                      : DateFormat('E, d MMM y').format(widget.selectedDate!),
                  // : 'Kamis, 02 Des 2019',
                  onTap: _onTapDatePicker,
                ),
              ),
              DropdownInkwell(
                label: 'Time',
                value: !widget.alreadySelectedTime
                    ? '- Choose Time -'
                    : formatDate(
                        DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          widget.selectedTime.hour,
                          widget.selectedTime.minute,
                        ),
                        [hh, ':', nn, ' ', am],
                      ).toString(),
                onTap: _onTapTimePicker,
              ),
            ],
          ),
        ),
        widget.showButtonNext ? ButtonNext(onPressButton) : Container(),
      ],
    );
  }
}
