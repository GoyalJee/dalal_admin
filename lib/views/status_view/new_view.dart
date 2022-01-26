import 'package:dalal_admin/controllers/list_controller.dart';
import 'package:dalal_admin/custom_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewView extends StatelessWidget {
  NewView({Key? key}) : super(key: key);

  final _controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: _controller.newList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomListTile(
                  bs: _controller.newList[index].bs!,
                  name: _controller.newList[index].name!,
                  phone: _controller.newList[index].phoneNumber!,
                  what: _controller.newList[index].what!,
                  budget: _controller.newList[index].budget!,
                ),
              );
            });
      }),
    );
  }
}
