import 'package:trip_planner/calendar_classes.dart';

// testing if the make title logic works

void main() {
  // is travel day
  Travel travel = Travel();
  travel.type = 'Plane';
  travel.departLocation = 'Sydney';
  travel.arriveLocation = 'Brisbane';
  Day day = Day();
  day.isTravelDay = true;
  day.travel = travel;
  day.generateTitle();
  print(day.title);

  // is stay day
  Stay stay = Stay();
  stay.location = 'Melbourne';
  stay.name = 'Hyatt Hotel';
  Day day2 = Day();
  day2.isTravelDay = false;
  day2.stay = stay;
  day2.generateTitle();
  print(day2.title);
}