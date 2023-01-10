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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: Expanded(
          child: Column(
            children: [
              TabBarView(
                children: [
                  Icon(Icons.flight, size: 350),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.directions_car, size: 350),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
