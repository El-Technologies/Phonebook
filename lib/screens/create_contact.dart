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
              padding: EdgeInsets.all(20.sp),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 206, 219, 230),
              ),
              child: Image.asset("assets/images/add_photo.png"),
            ),
            SizedBox()
            const Text(
              "Add photo",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
