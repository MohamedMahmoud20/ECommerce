// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names, avoid_types_as_parameter_names, non_constant_identifier_names, duplicate_ignore

import'package:flutter/material.dart';

import '../../Constant.dart';
Widget Card_Product_Details(Title , Subtitle){
  return Container(
    width: 180,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.withOpacity(0.1))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Title,
              style: TextStyle(fontSize: FontMeduimText ),
            ),
            SizedBox(
              width: 30,
            ),
            Subtitle
          ],
        ),
      ),
    ),
  );
}