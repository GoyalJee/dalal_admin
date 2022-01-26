import 'package:dalal_admin/controllers/complete_controller.dart';
import 'package:dalal_admin/controllers/list_controller.dart';
import 'package:dalal_admin/custom_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedView extends StatelessWidget {
  CompletedView({Key? key}) : super(key: key);

  final _controller = Get.put(CompController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: _controller.compList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomListTile(
                  bs: _controller.compList[index].bs!,
                  name: _controller.compList[index].name!,
                  phone: _controller.compList[index].phoneNumber!,
                  what: _controller.compList[index].what!,
                  budget: _controller.compList[index].budget!,
                ),
              );
            });
      }),
    );
  }
}
