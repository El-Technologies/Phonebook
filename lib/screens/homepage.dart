import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
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
  final TextEditingController _searchController = TextEditingController();

  List<Contact> _searchResults = [];
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 50,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        // Use the search query to filter the contacts
                        setState(() {
                          _searchResults = contacts
                              .where((contact) => contact.firstName
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.r)),
                        fillColor: const Color.fromARGB(255, 230, 228, 228),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 17.77.h,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        width: 35.w,
                        height: 35.w,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
