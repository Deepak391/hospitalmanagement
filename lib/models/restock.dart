import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/medicine.dart';

class Restock {
  String id;
  String med;

  Restock({required this.id, required this.med});

  factory Restock.fromSnapshot(QueryDocumentSnapshot d) {
    var m = d.data() as Map;
    var m1 = d["med"];

    return Restock(id: d.id, med: m1);
  }
}
