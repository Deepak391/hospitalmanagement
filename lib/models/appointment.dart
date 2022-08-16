class Appointment {
  String id;
  String userId;
  String docId;
  String Date;
  String time;
  String status;

  Appointment({
    required this.id,
    required this.Date,
    required this.docId,
    required this.userId,
    required this.status,
    required this.time,
  });
}
