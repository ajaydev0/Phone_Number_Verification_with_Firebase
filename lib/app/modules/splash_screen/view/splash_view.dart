import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

     return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png"))),
          ),
          const SizedBox(height: 10),
          const SizedBox(
              height: 30,
              width: 30,
              child: FittedBox(child: CupertinoActivityIndicator())),
        ],
      )),
    );
  }
}
