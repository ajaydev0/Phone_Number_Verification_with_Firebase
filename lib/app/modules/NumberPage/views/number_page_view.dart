import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/number_page_controller.dart';

class NumberPageView extends GetView<NumberPageController> {
  const NumberPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            body: Center(
                child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Image.asset(
                      "assets/font.jpg",
                      height: 180,
                    ),
                    const Text(
                      "Phone Verification",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Register your phone before getting Started!",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.amber, width: 2),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/bd.png",
                                  height: 13,
                                ),
                                Text(
                                  "+880",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 40, color: Colors.grey[500]),
                            ),
                            const SizedBox(width: 10),
                            Form(
                              key: controller.fromkey,
                              child: Expanded(
                                  child: TextFormField(
                                onTapOutside: ((ajay) {
                                  FocusScope.of(context).unfocus();
                                }),
                                cursorColor: Colors.amber,
                                controller: controller.number,
                                style: const TextStyle(fontSize: 20),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return controller.validateNumber(value);
                                },
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                  hintText: "Enter your number...",
                                  hintStyle: TextStyle(fontSize: 17),
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black),
                              onPressed: () {
                                controller.SendTheOtpClick(controller);
                              },
                              child: const Text("Send The OTP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)))),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            )),
          ),
          controller.isLoading.value
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
