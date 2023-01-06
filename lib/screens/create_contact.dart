import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/custom/appbar.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: "Add Contact",
            ),
            SizedBox(height: 10.h),
            Container(
              height: 100.w,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 206, 219, 230),
              ),
              child: Icon(
                Icons.add_photo_alternate_rounded,
                size: 50.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
