import 'package:flutter/foundation.dart';

class Attendee {
  final String name;
  final String phone;
  final String rollNo;

  Attendee(this.name, this.phone, this.rollNo);
}

class AttendeeProvider with ChangeNotifier {
  Attendee? _attendee;

  Attendee? get attendee => _attendee;

  void setAttendee(String name, String phone, String rollNo) {
    _attendee = Attendee(name, phone, rollNo);
    notifyListeners();
  }
}