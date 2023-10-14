import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/controller/menu_weather_controller.dart';

class CustomSearchAppBarMenuScreen extends StatelessWidget {
  const CustomSearchAppBarMenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MenuWeatherController controller = Get.put(MenuWeatherController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: TextFormField(
        onChanged: (value) {
          controller.changeSearch(value);
        },
        cursorColor: Colors.white,
        controller: controller.textEditingController,
        decoration: InputDecoration(
          hintText: 'Search for A search Or airport',
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: const Color.fromARGB(223, 122, 121, 170),
          contentPadding: EdgeInsets.all(2.h),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: IconButton(
              onPressed: () async {
                await controller.search();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(30.r),
              )),
        ),
      ),
    );
  }
}
