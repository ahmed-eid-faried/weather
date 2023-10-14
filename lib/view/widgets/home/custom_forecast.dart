import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/controller/myhomecontroller.dart';
import 'package:weather/view/widgets/home/itemweather.dart';

class CustomForecast extends StatelessWidget {
  const CustomForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());

    return Positioned(child: GetBuilder<MyHomePageControllerImp>(builder: (_) {
      return Container(
        // margin: const EdgeInsets.all(15.0),
        height: 260.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.white,
                  Colors.blueGrey,
                  Colors.grey,
                ]),
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            SizedBox(
              width: 40.w,
              child: Divider(
                color: Colors.black.withOpacity(0.5),
                thickness: 2.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.type = true;
                      controller.update();
                    },
                    child: Text(
                      'Hourly Forecast',
                      style: TextStyle(
                          color: controller.type == true
                              ? Colors.white
                              : Colors.grey[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      controller.type = false;
                      controller.update();
                    },
                    child: Text(
                      'Weekly Forecast',
                      style: TextStyle(
                          color: controller.type == false
                              ? Colors.white
                              : Colors.grey[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey,
                      Colors.black,
                      Colors.white,
                      Colors.blueGrey,
                      Colors.blue,
                    ]),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            if (controller.dataForecast != null)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      controller.dataForecast!.list!.length,
                      (index) => ItemWeather(
                          listItem: controller.dataForecast!.list![index]),
                    )
                  ],
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }));
  }
}
