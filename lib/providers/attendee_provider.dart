import 'package:flutter/material.dart';
import '../models/attendee.dart';

class AttendeeProvider with ChangeNotifier {
  Attendee? _attendee = Attendee.empty();

  Attendee? get attendee => _attendee;

  void setAttendee(String name, String phone, String rollNo) {
    _attendee = Attendee(name: name, phone: phone, rollNo: rollNo);
    notifyListeners();
  }

  void clearAttendee() {
    _attendee = Attendee.empty();
    notifyListeners();
  }
}
