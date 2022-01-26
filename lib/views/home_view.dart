import 'package:dalal_admin/views/status_view/completed_view.dart';
import 'package:dalal_admin/views/status_view/in_prog_view.dart';
import 'package:dalal_admin/views/status_view/new_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'broker_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title: const Text("Dalal Admin"),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(() => BrokerView());
                    },
                    icon: const Icon(Icons.person))
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'New',
                ),
                Tab(
                  text: 'InProgress',
                ),
                Tab(
                  text: 'Completed',
                )
              ]),
            ),
          ],
          body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [NewView(), InProgressView(), CompletedView()]),
        ),
      ),
    );
  }
}
