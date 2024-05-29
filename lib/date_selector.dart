import 'package:flutter/material.dart';
import 'package:trip_planner/calendar.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();

  DateTime? _startDateDT;
  DateTime? _endDateDT;

  DateTime stringToDateTime(String dateString) {
    // Split the string by the '/' separator
    List<String> dateParts = dateString.split('/');

    // Ensure the string is in the correct format
    if (dateParts.length != 3) {
      throw const FormatException(
          "The date string must be in the format DD/MM/YYYY");
    }

    // Parse the individual parts of the date
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    // Create and return the DateTime object
    return DateTime(year, month, day);
  }

  void storeDateTime() {
    String startDateString = _startDate.text;
    String endDateString = _endDate.text;

    setState(() {
      _startDateDT = stringToDateTime(startDateString);
      _endDateDT = stringToDateTime(endDateString);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tripr'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _startDate,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Start Date'),
                          hintText: 'Enter the start date'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _endDate,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('End Date'),
                          hintText: 'Enter the start date'),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                storeDateTime();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calendar(_startDateDT!, _endDateDT!)),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
