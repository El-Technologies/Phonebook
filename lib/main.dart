import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phonebook/contact.dart';
import 'custom/appbar.dart';
import 'custom/searchbar.dart';
import 'data.dart';
import 'screens/homepage.dart';

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
          routes: {
            '/homepage': (context) => HomePage(),
          },
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
