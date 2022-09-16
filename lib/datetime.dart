import 'dart:math';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class DateTimes extends StatefulWidget {
  const DateTimes({Key? key}) : super(key: key);

  @override
  State<DateTimes> createState() => _DateTimesState();
}

class _DateTimesState extends State<DateTimes> {

  String pickedDate = "Choose date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child : TextButton(
                onPressed: () {
                  _pickDateDialog ();
                },
                child: Text(pickedDate)),

        )


    );
  }
  _pickDateDialog() {

    showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.input, initialDate: DateTime.now())
        .then((ChooseeDate) {
      if (ChooseeDate == null) {
        return;
      }

      setState(() {
        print(ChooseeDate);
        pickedDate = ChooseeDate.toString();
      });
    });
  }
}
