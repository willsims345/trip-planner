import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar(this.startDate, this.endDate, {super.key});

  final DateTime startDate;
  final DateTime endDate;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime>? dateRange;

  List<DateTime> generateDateRange(DateTime startDate, DateTime endDate) {
    // Ensure the startDate is before or the same as endDate
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('Start date must be before or the same as end date');
    }

    List<DateTime> dateList = [];
    DateTime currentDate = startDate;

    while (!currentDate.isAfter(endDate)) {
      dateList.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dateList;
  }

  @override
  void initState() {
    dateRange = generateDateRange(widget.startDate, widget.endDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tripr'),
      ),
            body: dateRange == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: dateRange!.length,
                itemBuilder: (context, index) {
                  return CalDay(dateRange![index]);
                },
              ),
            ),
    );
  }
}

class CalDay extends StatelessWidget {
  CalDay(this.date, {super.key})
      : dateString = DateFormat('dd/MM/yyyy').format(date);

  final DateTime date;
  final String dateString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dateString,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}