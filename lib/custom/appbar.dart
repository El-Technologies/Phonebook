import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.trailing,
  });

  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: trailing != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          title ?? const SizedBox(),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
