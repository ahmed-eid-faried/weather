import 'package:weather/core/class/curd.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(Curd());
   }
}
