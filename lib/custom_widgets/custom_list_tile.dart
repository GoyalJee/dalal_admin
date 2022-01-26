import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalal_admin/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final String name;
  final String what;
  final String phone;
  final String budget;
  final String bs;

  const CustomListTile({
    Key? key,
    required this.name,
    required this.phone,
    required this.what,
    required this.budget,
    required this.bs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      tileColor: bs == "Buy"
          ? Colors.green.withOpacity(0.7)
          : Colors.red.withOpacity(0.7),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(what),
          Text(
            budget,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: FloatingActionButton(
          child: const Icon(Icons.more_horiz_rounded),
          onPressed: () {
            Get.bottomSheet(
                Wrap(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Update Status",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    CustomButton(
                        onTap: () async {
                          await updateStatus('inProgress');
                        },
                        btnText: "Deal Is In Progress"),
                    CustomButton(
                        onTap: () async {
                          await updateStatus('completed');
                        },
                        btnText: "Deal Completed"),
                    const Text(
                      "Update Status",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                barrierColor: Colors.black54,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))));
          },
          backgroundColor: Colors.white54,
          elevation: 0,
        ),
      ),
    );
  }

  updateStatus(String newStatus) async {
    try {
      var collection = FirebaseFirestore.instance
          .collection('bs')
          .where('name', isEqualTo: name)
          .where('phone', isEqualTo: phone)
          .where('what', isEqualTo: what)
          .where('budget', isEqualTo: budget)
          .where('bs', isEqualTo: bs);
      var querySnapshots = await collection.get();
      for (var doc in querySnapshots.docs) {
        await doc.reference.update({
          'status': newStatus,
        }).whenComplete(() {
          Get.back();
          Get.snackbar("Status Changed", "...");
        });
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red.withOpacity(0.7));
    }
  }
}
