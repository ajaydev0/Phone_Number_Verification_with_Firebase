import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../router/app_pages.dart';
import '../controllers/otp_page_controller.dart';

class OtpPageView extends GetView<OtpPageController> {
  const OtpPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    // Controller Components
    var code = "";
    RxBool isLoading = false.obs;
    var id = Get.arguments;
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Center(
                child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      "assets/otp.jpg",
                      height: 180,
                    ),
                    const Text(
                      "SMS Verification",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Code Already Send, Check Message Option",
                        // "Register your phone before getting Started!",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: controller.fromkey2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Pinput(
                          controller: controller.smsCode,
                          onTapOutside: ((ajayDev) {
                            FocusScope.of(context).unfocus();
                          }),
                          onCompleted: (pin) async {
                            isLoading.value = true;
                            code = pin;
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: id, smsCode: code);
                              await auth.signInWithCredential(credential);
                              Get.toNamed(Routes.HOME_PAGE);
                              isLoading.value = false;
                              print("Verified Code");
                            } catch (e) {
                              isLoading.value = false;
                              Get.snackbar(
                                  "Warning", "Wrong Code, Try Again....");
                            }
                          },
                          length: 6,
                          defaultPinTheme: submittedPinTheme,
                          focusedPinTheme: submittedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          // validator: (value) {
                          //   if (value == null && value == "") {
                          //     return "Enter Sms Code";
                          //   }
                          //   return null;
                          // },
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          // onCompleted: (pin) => print(pin),
                          // onChanged: (value) {
                          //   code = value;
                          //   // return controller.onChanged(value);
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.black),
                            onPressed: () async {
                              if (controller.fromkey2.currentState!
                                      .validate() &&
                                  controller.smsCode.length == 6) {
                                isLoading.value = true;
                                try {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId: id,
                                          //  NumberPageController.Id,
                                          smsCode: code);
                                  await auth.signInWithCredential(credential);
                                  Get.toNamed(Routes.HOME_PAGE);
                                  isLoading.value = false;
                                  print("Verified Code");
                                } catch (e) {
                                  isLoading.value = false;
                                  Get.snackbar(
                                      "Warning", "Wrong Code, Try Again....");
                                  // print("Wrong Code, Try Again....");
                                }
                              } else {
                               Get.snackbar(
                                      "Warning", "Please Enter your code !");
                              }

                              // controller.sendTheOtpClick(controller);
                            },
                            child: const Text("Verified Phone Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)))),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            )),
          ),
          isLoading.value
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(.6),
                  alignment: Alignment.center,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          height: 30,
                          width: 30,
                          child:
                              FittedBox(child: CupertinoActivityIndicator())),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
