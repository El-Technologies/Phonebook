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
        children: [
          Card(
            shape: const CircleBorder(),
            child: Container(
              height: 50.w,
              width: 50.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              
            ),
          )
        ],
      ),
    );
  }
}
