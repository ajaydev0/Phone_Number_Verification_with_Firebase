// ignore_for_file: non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../router/app_pages.dart';

class NumberPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading = false.obs;
  }

  RxBool isLoading = false.obs;
  static String Id = "";

  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  late final TextEditingController number = TextEditingController();
  int countryCode = 880;

  SendTheOtpClick(data) async {
    //  data.isLoading.value = true;
    if (fromkey.currentState!.validate() && number.length == 10) {
      data.isLoading.value = true;
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+880${data.number.text}",
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
          codeSent: (String verificationId, int? resendToken) {
          
            Get.toNamed(Routes.OTP_PAGE, arguments: verificationId);
              data.isLoading.value = false;
          },
        );
      } catch (e) {
        data.isLoading.value = false;
        print(e);
      }
    } else {
      return Get.snackbar("Required", "Please Enter your full Number");
    }
  }

  validateNumber(value) {
    if (value == null || value.trim().isEmpty) {
      return Get.snackbar("Required", "Please Enter your Number");
    }

    return null;
  }
}
