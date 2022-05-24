// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, non_constant_identifier_names, must_be_immutable

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';

class CardRegister extends StatelessWidget {

  var Email = TextEditingController();
  var Password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 630,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 25,
              offset: Offset(0,10)
          )
        ]),
        child: Card(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
          shadowColor: primarycolor,
          elevation: 1.5,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20 , left: 20 , top: 25 , bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      children: const[
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: Fontlargetext,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextFiield("Name" ,20.0 , name ),
              TextFiield(" Email", 20.0 , Email),
              TextFeidPass("Password" , Password),
              TextFiield(" Phone", 20.0 , phone),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 30 , left: 20 , right: 20),
                child: MaterialButton(
                  onPressed: () {
                    Register(
                        name.text,
                        Email.text,
                        phone.text,
                        Password.text,
                      context
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: whitelight),
                  ),
                  height: 5.h,
                  minWidth: 85.w,
                  color: primarycolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
