import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarMenuScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarMenuScreen({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2E335A),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            'Weather',
            style: TextStyle(color: Colors.white, fontSize: 35.sp),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 40.r,
          color: Colors.white,
        ),
      ),
    );
  }
}
