// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:flutter/material.dart';
import '../../../Constant.dart';

class EditProfile extends StatefulWidget {
  var Name;
  var Email;
  var phone;
EditProfile(this.Email, this.Name , this.phone);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var Email = TextEditingController();
  var Password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  @override
  void initState() {
    Email.text= widget.Email;
    name.text= widget.Name;
    phone.text= widget.phone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: Card(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 20, top: 20),
        shadowColor: primarycolor,
        elevation: 2,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListView(
          children: [
            SizedBox(height: 80,),
            TextFiield("Name" ,20.0 , name ),
            TextFiield(" Email", 20.0 , Email),
            TextFeidPass(" Phone", phone),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 30 , left: 20 , right: 20),
              child: MaterialButton(
                onPressed: () {
                  editProfile(
                      name.text,
                      Email.text,
                      phone.text,
                      Password.text,
                      context
                  );
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: whitelight),
                ),
                height: 45,
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
