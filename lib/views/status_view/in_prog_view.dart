import 'package:dalal_admin/controllers/in_prog_controller.dart';
import 'package:dalal_admin/controllers/list_controller.dart';
import 'package:dalal_admin/custom_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InProgressView extends StatelessWidget {
  InProgressView({Key? key}) : super(key: key);

  final _controller = Get.put(ProgController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: _controller.progList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomListTile(
                  bs: _controller.progList[index].bs!,
                  name: _controller.progList[index].name!,
                  phone: _controller.progList[index].phoneNumber!,
                  what: _controller.progList[index].what!,
                  budget: _controller.progList[index].budget!,
                ),
              );
            });
      }),
    );
  }
}
