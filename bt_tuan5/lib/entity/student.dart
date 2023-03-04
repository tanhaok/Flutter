import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String name;
  final int yob;
  final int grade;
  final DocumentReference info;

  Student.formSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
            snapshot.data() as Map<dynamic, dynamic>, snapshot.reference);

  Student.fromMap(Map<dynamic, dynamic> map, reference)
      : assert(map['name'] != null),
        assert(map['yob'] != null),
        assert(map['grade'] != null),
        name = map['name'],
        yob = map['yob'],
        grade = map['grade'],
        info = reference;
}
