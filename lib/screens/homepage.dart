import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/custom/appbar.dart';
import 'package:phonebook/custom/searchbar.dart';
import 'package:phonebook/data.dart';
import 'package:phonebook/screens/create_contact.dart';

import 'view_contact.dart';

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
              builder: (context) => CreateContact(
                contacts: contacts,
              ),
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
              title: Text(
                "Contacts",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
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
                ),
              ),
            ),
            SizedBox(height: 10.h),
            const CustomSearchBar(),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: searchQuery.isEmpty
                    ? contacts.length
                    : contacts
                        .where((contact) =>
                            contact.firstName.contains(searchQuery) ||
                            contact.lastName!.contains(searchQuery) ||
                            contact.email!.contains(searchQuery) ||
                            contact.phoneNumber.contains(searchQuery))
                        .toList()
                        .length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewContact(contact: contacts[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Card(
                        shape: const CircleBorder(),
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: contacts[index].pic != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage(contacts[index].pic!),
                                )
                              : null,
                        ),
                      ),
                      title: Text(
                        "${contacts[index].firstName} ${contacts[index].lastName ??= ""}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: contacts[index].email != null &&
                              contacts[index].email?.trim() != ""
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
                    ),
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
