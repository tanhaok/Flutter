import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Info {
  final String name;
  final Timestamp dob;
  final String faculty;
  final String address;
  final DocumentReference stu;

  Info.formSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
            snapshot.data() as Map<dynamic, dynamic>, snapshot.reference);

  Info.fromMap(Map<dynamic, dynamic> map, reference)
      : assert(map['name'] != null),
        assert(map['dob'] != null),
        assert(map['faculty'] != null),
        assert(map['address'] != null),
        name = map['name'],
        dob = map['dob'],
        faculty = map['faculty'],
        address = map['address'],
        stu = reference;
}
