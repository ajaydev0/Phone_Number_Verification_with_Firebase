import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OtpPageController extends GetxController {
    GlobalKey<FormState> fromkey2 = GlobalKey<FormState>();
  late final TextEditingController smsCode= TextEditingController();
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   isLoading = false.obs;
  // }

  // RxBool isLoading = false.obs;

  // var id = Get.arguments;
  // var code = "";

  // final FirebaseAuth auth = FirebaseAuth.instance;

  // void onChanged(value) {
  //   code = value;
  // }

  // otpvalidate(value) {
  //   if (value == null || value.trim().isEmpty) {
  //     return Get.snackbar("Required", "Please Enter your Number");
  //   }

  //   return null;
  // }

// sendTheOtpClick(data) async {
//     // onComplete(pin) async {
//     //   code = pin;
//     //   try {
//     //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//     //         verificationId: id,
//     //         //  NumberPageController.Id,
//     //         smsCode: code);
//     //     await auth.signInWithCredential(credential);
//     //     Get.toNamed(Routes.HOME_PAGE);
//     //     data.isLoading.value = false;
//     //     print("Verified Code");
//     //   } catch (e) {
//     //     data.isLoading.value = false;
//     //     Get.snackbar("Warning", "Wrong Code, Try Again....");
//     //     // print("Wrong Code, Try Again....");
//     //   }
//     // }

// /////
//   //   data.isLoading.value = true;
//   //   try {
//   //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//   //         verificationId: id,
//   //         //  NumberPageController.Id,
//   //         smsCode: code);
//   //     await auth.signInWithCredential(credential);
//   //     Get.toNamed(Routes.HOME_PAGE);
//   //     data.isLoading.value = false;
//   //     print("Verified Code");
//   //   } catch (e) {
//   //     data.isLoading.value = false;
//   //     return Get.snackbar("Warning", "Wrong Code, Try Again....");
//   //     // print("Wrong Code, Try Again....");
//   //   }
//   }
}
