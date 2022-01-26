import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerModel{
  String? name;
  String? phoneNumber;

  BrokerModel({required this.name, required this.phoneNumber});

  static BrokerModel fromSnapshot(DocumentSnapshot snapshot){
    BrokerModel brokerModel = BrokerModel(name: snapshot['name'], phoneNumber: snapshot['phone']);
    return brokerModel;
  }
}