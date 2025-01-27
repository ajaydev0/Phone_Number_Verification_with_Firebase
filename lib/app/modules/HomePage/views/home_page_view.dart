import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePageView'),
        centerTitle: true,
      ),
      body: const Center(
        child:  Text(
                "Good Job Bro..😎",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
