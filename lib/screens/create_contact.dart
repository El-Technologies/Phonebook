import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Column(
                      children: [
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
                        SizedBox(height: 10.h),
                        const Text(
                          "Add photo",
                          style: TextStyle(
                            color: Color.fromARGB(255, 9, 92, 160),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        const Icon(Icons.person_outline),
                        Column(
                          children: const [
                            CustomField(
                              hintText: "First name",
                            ),
                            CustomField(
                              hintText: "Last name",
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
