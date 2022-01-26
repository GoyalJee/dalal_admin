import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalal_admin/models/broker_model.dart';
import 'package:get/get.dart';

class BrokerController extends GetxController {
  final brokerList = <BrokerModel>[].obs;

  Stream<List<BrokerModel>> getBrokerList() {
    return FirebaseFirestore.instance
        .collection('broker')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => BrokerModel.fromSnapshot(e)).toList();
    });
  }

  @override
  void onInit() {
    brokerList.bindStream(getBrokerList());
    super.onInit();
  }
}
