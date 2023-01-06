import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

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
            title,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 50.w,
          )
        ],
      ),
    );
  }
}
