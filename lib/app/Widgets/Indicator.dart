import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

KIndicator() {
  return Get.dialog(
      barrierDismissible: false,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 137, vertical: 320),
        child: Container(
          // height: 50,
          // width: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),

          alignment: Alignment.center,
          child: SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(child: CupertinoActivityIndicator())),
        ),
      ));
}
