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
  final controller = TabController();
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
            Expanded(
                child: TabBar(
                  controller: ,
              tabs: [],
            ))
          ],
        ),
      ),
    );
  }
}
