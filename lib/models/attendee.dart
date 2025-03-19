class Attendee {
  final String name;
  final String phone;
  final String rollNo;

  Attendee({
    required this.name,
    required this.phone,
    required this.rollNo,
  });

  factory Attendee.empty() => Attendee(name: '', phone: '', rollNo: '');
}
