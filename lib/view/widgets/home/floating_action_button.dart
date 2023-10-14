import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/myhomecontroller.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());
    return FloatingActionButton(
      onPressed: () {
        Get.defaultDialog(
          onCancel: () {
            controller.textEditingController.text = '';
            Get.back();
          },
          onConfirm: () {
            controller.addCity();
          },
          title: 'Add City',
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: Colors.white,
              controller: controller.textEditingController,
              decoration: const InputDecoration(
                hintText: "Select your City",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color.fromARGB(223, 192, 191, 238),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        size: 40,
        color: Color.fromARGB(255, 99, 64, 228),
      ),
    );
  }
}
