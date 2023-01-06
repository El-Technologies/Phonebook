import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
import 'package:phonebook/custom/appbar.dart';
import 'package:phonebook/data.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstName = TextEditingController();
    final TextEditingController lastName = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController email = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CloseButton(),
                Expanded(
                  child: CustomAppBar(
                    title: "Add Contact",
                    trailing: MaterialButton(
                      onPressed: () {
                        print(firstName.text.trim() != "");
                        print(phone.text.trim() != "");
                        setState(() {
                          if (firstName.text.trim().isNotEmpty &&
                              phone.text.isNotEmpty) {
                            contacts.add(
                              Contact(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                phoneNumber: phone.text,
                                email: email.text,
                              ),
                            );
                            Navigator.of(context).pop();
                            contacts.sort(
                                (a, b) => a.firstName.compareTo(b.firstName));
                          }
                        });
                      },
                      child: Container(
                        width: 70.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 21, 102, 168),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                    CustomField(
                      icon: Icon(
                        Icons.person_outline,
                        size: 20.sp,
                      ),
                      hintText: "First name",
                      controller: firstName,
                    ),
                    SizedBox(height: 10.h),
                    CustomField(
                      hintText: "Last name",
                      controller: lastName,
                    ),
                    SizedBox(height: 20.h),
                    CustomField(
                      icon: Icon(
                        Icons.phone_rounded,
                        size: 20.sp,
                      ),
                      hintText: "Phone",
                      controller: phone,
                    ),
                    SizedBox(height: 20.h),
                    CustomField(
                      icon: Icon(
                        Icons.email_outlined,
                        size: 20.sp,
                      ),
                      hintText: "Email",
                      controller: email,
                    ),
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
    required this.controller,
    this.icon,
  });

  final String hintText;
  final TextEditingController controller;
  final Icon? icon;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
      },
      decoration: InputDecoration(
        icon: widget.icon ??
            SizedBox(
              width: 20.w,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
        labelText: widget.hintText,
      ),
    );
  }
}
