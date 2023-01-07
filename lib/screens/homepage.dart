import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
import 'package:phonebook/custom/appbar.dart';
import 'package:phonebook/custom/searchbar.dart';
import 'package:phonebook/data.dart';
import 'package:phonebook/screens/create_contact.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Add a search controller to control the TextField
  final TextEditingController _searchController = TextEditingController();

  // Add a list to store the search results
  List<Contact> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add the TextField to allow the user to enter a search query
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
          ),
          // Add the ListView.builder to display the search results
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                Contact contact = _searchResults[index];
                return ListTile(
                  title: Text(contact.firstName),
                  subtitle: Text(contact.phoneNumber),
                );
              },
            ),
          ),
        ],
      ),
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
    );
  }
}
