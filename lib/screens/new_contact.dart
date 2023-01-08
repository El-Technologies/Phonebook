import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/custom/appbar.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "",
              trailing: Card(
                shape: const CircleBorder(),
                child: Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
