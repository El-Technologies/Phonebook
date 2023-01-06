import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
import 'custom/appbar.dart';
import 'custom/searchbar.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'El Phonebook',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Poppins",
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

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
          setState(() {
            
          });
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
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
                        "${contacts[index].firstName} ${contacts[index].lastName ??= ""}"),
                    subtitle: Text(contacts[index].phoneNumber),
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
