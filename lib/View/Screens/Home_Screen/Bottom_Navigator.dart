// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:e_commerce/View/Screens/Profile/Profile.dart';
import 'package:e_commerce/View/Widgets/BottomNavigator.dart';
import 'package:flutter/material.dart';

import '../Cart.dart';
import 'Explore.dart';

class Home_Screen extends StatefulWidget {

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int index = 0;

  void ontap(inde) {
    setState(() {
      index = inde;
    });
  }

  @override
  Widget build(BuildContext context) {
    List ScreensBottom = [
      Explore(),
      Cart(),
      Profile()
    ];

    return Scaffold(
      body: ScreensBottom.elementAt(index),
      bottomNavigationBar: BottomNavigator(
        index: index,
        ontap: ontap,
      ),
    );
  }
}
