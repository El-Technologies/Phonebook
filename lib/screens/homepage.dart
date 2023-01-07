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
  @override
  Widget build(BuildContext context) {
    contacts.sort((a, b) => a.firstName.compareTo(b.firstName));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateContact(contacts: contacts,),
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
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Add a state variable to store the search query
  String _searchQuery;

  @override
  Widget build(BuildContext context) {
    // Filter the list of contacts based on the search query
    List<Contact> filteredContacts = contacts.where((contact) {
      if (_searchQuery == null || _searchQuery.isEmpty) {
        return true;
      }
      return contact.firstName
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          contact.lastName!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          contact.phoneNumber
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          contact.email!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        // Add a TextField widget to the app bar to allow the user to enter the search query
        title: TextField(
          onChanged: (value) {
            // Update the search query state variable
            setState(() {
              _searchQuery = value;
            });
          },
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
      // Use the filtered list of contacts to build the list view
      body: ListView.builder(
        itemCount: filteredContacts.length,
        itemBuilder: (context, index) {
          Contact contact = filteredContacts[index];
          return ListTile(
            title: Text(contact.firstName),
            // Other properties of the ListTile widget
          );
        },
      ),
    );
  }
}
