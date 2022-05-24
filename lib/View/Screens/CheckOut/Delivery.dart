// ignore_for_file: prefer_const_constructors, file_names, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {

  bool Dels = false;
  bool Deln = false;
  bool Del = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
            children: [
      SizedBox(
        width: 390,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30),
              child: CheckboxListTile(
                value: Dels,
                onChanged: (value) {
                  if (Del == false && Deln == true && Dels == false ||
                      Del == false && Deln == false && Dels == false) {
                    setState(() {
                      Dels = value!;
                      Deln = false;
                      Del = false;
                    });
                  } else {
                    print("======");
                  }
                  Save("Dels", Dels);
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 13.0, right: 5),
                  child: Text(
                    "Standard Delivery",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text("Order will be delivered between 3 - 5 business days"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 30),
              child: CheckboxListTile(
                value: Deln,
                onChanged: (value) {
                  setState(() {
                    if (Del == false && Dels == true ||
                        Dels == false && Del == true ||
                        Del == false && Deln == false && Dels == false) {
                      Deln = value!;
                      Del = false;
                      Dels = false;
                    }
                  });
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 13.0, right: 5),
                  child: Text(
                    "Next Day Delivery",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                    "Place your order before 6pm and your i"
                        "tems will be delivered the next day"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 30),
              child: CheckboxListTile(
                value: Del,
                onChanged: (value) {
                  setState(() {
                    if (Dels == true && Deln == false ||
                        Deln == true && Dels == false ||
                        Del == false && Deln == false && Dels == false) {
                      Del = value!;
                      Deln = false;
                      Dels = false;
                    }
                  });
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 5),
                  child: Text(
                    "Nominated Delivery",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                    "Pick a particular date from the "
                        "calendar and order will be delivered on selected date"),
              ),
            ),
          ],
        ),
      )
    ]));
  }
  Save(key , value)async{
    var pref=await SharedPreferences.getInstance();
    pref.setBool(key,value);
  }
}
