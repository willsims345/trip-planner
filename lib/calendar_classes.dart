import 'package:intl/intl.dart';

class Day {
  Day(this.date) : dateString = DateFormat('dd/MM/yyyy').format(date);

  DateTime date;
  String dateString;
  bool? isTravelDay;
  Travel? travel;
  Stay? stay;

  String? title;

  void generateTitle() {
    if(isTravelDay!) {
      title = '${travel!.type} from ${travel!.departLocation} to ${travel!.arriveLocation}';
      return;
    } else {
      title = 'Stay in ${stay!.location} at ${stay!.name}';
      return;
    }
  }

  String getDateString() {
    return DateFormat('dd/MM/yyyy').format(date);
  }

}

class Travel {
  Travel();

  String? type; // eg. plane, bus, train etc.
  String? bookedThrough;
  DateTime? departTime;
  String? departLocation;
  DateTime? arriveTime;
  String? arriveLocation;
  int? transfers;
  String? bookedBy;

}

class Stay {
  Stay();

  String? type; // the type of stay (hostel, hotel, AirBnB etc.)
  String? name;
  String? bookedThrough;
  String? bookedBy;
  String? location;

}