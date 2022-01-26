import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalal_admin/models/list_model.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  final newList = <ListModel>[].obs;

  Stream<List<ListModel>> getList() {
    return FirebaseFirestore.instance
        .collection('bs')
        .where('status', isEqualTo: 'new')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ListModel.fromSnapshot(e)).toList();
    });
  }

  @override
  void onInit() {
    newList.bindStream(getList());
    super.onInit();
  }
}
