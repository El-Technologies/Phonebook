import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
import 'package:phonebook/custom/appbar.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({
    super.key,
    required this.contact,
  });

  final Contact contact;

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
              title: Card(
                shape: const CircleBorder(),
                child: Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const BackButton(),
                ),
              ),
              trailing: Card(
                shape: const CircleBorder(),
                child: Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.more_horiz_rounded),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 120.w,
              width: 120.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
                "${widget.contact.firstName}${widget.contact.lastName != "" ? " ${widget.contact.lastName}" : ""}"),
            (widget.contact.email != "" && widget.contact.email != null)
                ? Text(widget.contact.email ?? "")
                : const SizedBox(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Stack(
                children: [
                  Container(
                    width: 200.w,
                    height: 40.h,
                    padding: EdgeInsets.only(right: 30.w),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "History",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 110.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: const Center(
                      child: Text(
                        "Details",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Detail(
              title: "Phone Number",
              subtitle: widget.contact.phoneNumber,
              trailing: const Icon(
                Icons.phone,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
            Text(subtitle),
          ],
        ),
        TrailingIcon(),
      ],
    );
  }
}

class TrailingIcon extends StatelessWidget {
  const TrailingIcon({
    super.key,
    this.icon,
  });

  final Icons? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.w,
      width: 30.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
      ),
    );
  }
}
