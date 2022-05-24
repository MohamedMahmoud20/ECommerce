// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_types_as_parameter_names, must_be_immutable, non_constant_identifier_names, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Constant.dart';
class Card_F_G extends StatelessWidget {
  Widget Image;
  String Titlee;

  Card_F_G({required this.Titlee, required this.Image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 25,
            offset: Offset(0, 10))
      ]),
      height: 7.h,
      width: 85.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image,
              Text(
                Titlee,
                style: TextStyle(fontSize: Fonttextbottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
