import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel {
  String? name;
  String? phoneNumber;
  String? bs;
  String? what;
  String? budget;
  String? status;

  ListModel(
      {required this.name,
        required this.phoneNumber,
        required this.bs,
        required this.what,
        required this.budget,
        required this.status});

  static ListModel fromSnapshot(DocumentSnapshot snapshot) {
    ListModel listModel = ListModel(
        name: snapshot['name'],
        phoneNumber: snapshot['phone'],
        bs: snapshot['bs'],
        what: snapshot['what'],
        budget: snapshot['budget'],
        status: snapshot['status']);

    return listModel;
  }
}
