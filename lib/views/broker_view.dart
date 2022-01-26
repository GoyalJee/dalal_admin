import 'package:dalal_admin/constants/my_colors.dart';
import 'package:dalal_admin/controllers/broker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class BrokerView extends StatelessWidget {
  BrokerView({Key? key}) : super(key: key);

  final _controller = Get.put(BrokerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            forceElevated: true,
            floating: true,
            snap: true,
            title: const Text("Dalal Admin"),
            actions: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded))
            ],
          )
        ],
        body: Obx(() {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.brokerList.length,
            itemBuilder: (context, index) {
              var phone = "+91${_controller.brokerList[index].phoneNumber}";
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: Get.size.width,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: MyColors.primary),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: Get.size.width/1.5,
                          child: Text(
                            _controller.brokerList[index].name!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .apply(color: MyColors.dark),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () async {
                              Get.snackbar("Connecting...",
                                  "Making Direct Phone Call to ${_controller.brokerList[index].name!}",
                                  duration: const Duration(seconds: 3));
                              await FlutterPhoneDirectCaller.callNumber(phone);
                            },
                            icon: const Icon(
                              Icons.call_rounded,
                              color: MyColors.dark,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    ));
  }
}
