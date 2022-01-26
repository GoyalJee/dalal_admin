import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalal_admin/models/list_model.dart';
import 'package:get/get.dart';

class ProgController extends GetxController {
  final progList = <ListModel>[].obs;

  Stream<List<ListModel>> getList() {
    return FirebaseFirestore.instance
        .collection('bs')
        .where('status', isEqualTo: 'inProgress')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ListModel.fromSnapshot(e)).toList();
    });
  }

  @override
  void onInit() {
    progList.bindStream(getList());
    super.onInit();
  }
}
