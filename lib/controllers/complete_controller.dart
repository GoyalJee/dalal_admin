import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalal_admin/models/list_model.dart';
import 'package:get/get.dart';

class CompController extends GetxController {
  final compList = <ListModel>[].obs;

  Stream<List<ListModel>> getList() {
    return FirebaseFirestore.instance
        .collection('bs')
        .where('status', isEqualTo: 'completed')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ListModel.fromSnapshot(e)).toList();
    });
  }

  @override
  void onInit() {
    compList.bindStream(getList());
    super.onInit();
  }
}