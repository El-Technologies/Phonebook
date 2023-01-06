import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/custom/appbar.dart';
import 'package:phonebook/custom/searchbar.dart';
import 'package:phonebook/data.dart';
import 'package:phonebook/screens/create_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    contacts.sort((a, b) => a.firstName.compareTo(b.firstName));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateContact(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Contacts",
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
            ),
            SizedBox(height: 10.h),
            const CustomSearchBar(),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Card(
                      shape: const CircleBorder(),
                      child: Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    title: Text(
                      "${contacts[index].firstName} ${contacts[index].lastName ??= ""}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: contacts[index].email != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contacts[index].email!,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                              Text(contacts[index].phoneNumber),
                            ],
                          )
                        : Text(contacts[index].phoneNumber),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
