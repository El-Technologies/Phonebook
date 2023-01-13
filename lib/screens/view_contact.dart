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
                  height: 35.w,
                  width: 35.w,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Detail(
                    title: "Phone Number",
                    subtitle: widget.contact.phoneNumber,
                    trailingIcon: const [
                      Icons.message,
                      Icons.phone,
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Detail(
                    title: "Phone Number",
                    subtitle: widget.contact.phoneNumber,
                    trailingIcon: const [
                      Icons.email,
                    ],
                  ),
                ],
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
    required this.trailingIcon,
  });

  final String title;
  final String subtitle;
  final List<IconData> trailingIcon;

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
        (trailingIcon.length > 1)
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 20.w,
                    child: TrailingIcon(
                      icon: trailingIcon[0],
                    ),
                  ),
                  TrailingIcon(
                    icon: trailingIcon[1],
                  )
                ],
              )
            : TrailingIcon(
                icon: trailingIcon[0],
              ),
      ],
    );
  }
}

class TrailingIcon extends StatelessWidget {
  const TrailingIcon({
    super.key,
    this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 35.w,
          width: 35.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        Positioned(
          child: Container(
            height: 32.w,
            width: 32.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 17.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
