// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, file_names, avoid_types_as_parameter_names, must_be_immutable, avoid_print, must_call_super

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/View/Authentication/Register.dart';
import 'package:e_commerce/View/Authentication/Signin_Screen.dart';
import 'package:e_commerce/View/Screens/Home_Screen/Bottom_Navigator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';

class CardSignin extends StatefulWidget {
  @override
  State<CardSignin> createState() => _CardSigninState();
}

class _CardSigninState extends State<CardSignin> {

  var Email = TextEditingController();
  var Password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  // ReadP() async {
  //   var pref = await SharedPreferences.getInstance();
  //   var key = "token";
  //   var Token = pref.getString(key);
  //   if (Token !="0" && Token !=null) {
  //     print("ReaMain =====$Token");
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             builder: (BuildContext context) {
  //       return Home_Screen();
  //     }
  //     ), (route) => false);
  //   } else if(Token==null) {
  //    print("Main Null");
  //   }
  // }
  // @override
  // void initState() {
  //   ReadP();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 25,
            offset: Offset(0, 10))
      ]),
      child: Card(
        margin: EdgeInsets.only(right: 10, left: 10, top: 70),
        shadowColor: primarycolor,
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 25, bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: Fontlargetext,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sign in to Continue",
                        style: TextStyle(
                            fontSize: Fonttextbottom, color: SuvaGrey),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Register_Screen();
                      }));
                    },
                    child: Text(
                      "SIGN",
                      style: TextStyle(
                          fontSize: FontMeduimText, color: primarycolor),
                    ),
                  )
                ],
              ),
            ),
            TextFiield(" Email", 20.0, Email),
            TextFeidPass("Password", Password),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: black, fontSize: Fonttextbottom),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 30),
              child: MaterialButton(
                onPressed: () {
                  Login(Email.text, Password.text, context);
                },
                child: Text(
                  "SIGN IN",
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
    );
  }
}