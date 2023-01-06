import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape: const CircleBorder(),
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
            "Contact",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            shape: const CircleBorder(),
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
