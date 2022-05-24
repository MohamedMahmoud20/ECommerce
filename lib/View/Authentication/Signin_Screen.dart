// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:e_commerce/Controller/Responsive.dart';
import 'package:e_commerce/View/Widgets/CardSignin.dart';
import 'package:e_commerce/View/Widgets/ShortWidgets.dart';
import 'package:flutter/material.dart';
import '../../Constant.dart';
import 'package:sizer/sizer.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(mobilewidget:Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardSignin(),
              SizedBox(
                height:3.h,
              ),
              Text(
                "-OR-",
                style: TextStyle(fontSize: FontMeduimText),
              ),
              SizedBox(
                height: 4.h,
              ),
              GestureDetector(
                onTap: (){},
                child:
                Card_F_G(Titlee: 'Sign In with Facebook', Image: Icon(Icons.facebook),),
              ),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: (){},
                child:Card_F_G(Titlee: 'Sign In with Google',
                  Image: Image.asset("assets/icon/\$RKEQXYW.png"),),
              ),
            ],
          ),
        ),
      ),
    ) );
  }
}
