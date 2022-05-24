// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:flutter/material.dart';

import 'EditProfile.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    GetProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: GetProfile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData)
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 10, top: 80, bottom: 80),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icon/Avatar.png",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${snapshot.data["name"]}",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${snapshot.data["email"]}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ))
                                ],
                              )
                            ],
                          )),
                      LISTTILE("assets/SVG/Group 188.svg", "Edit Profile", () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EditProfile(
                            snapshot.data["email"],
                            snapshot.data["name"],
                            snapshot.data["phone"],
                          );
                        }));
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      LISTTILE("assets/SVG/Group 185.svg", "Shipping Address",
                          () {}),
                      SizedBox(
                        height: 10,
                      ),
                      LISTTILE(
                          "assets/SVG/Group 194.svg", "Order History", () {}),
                      SizedBox(
                        height: 10,
                      ),
                      LISTTILE("assets/SVG/Group 197.svg", "Cards", () {}),
                      SizedBox(
                        height: 10,
                      ),
                      LISTTILE(
                          "assets/SVG/Group 198.svg", "Notifications", () {}),
                      SizedBox(
                        height: 10,
                      ),
                      LISTTILE("assets/SVG/Group 200.svg", "Log Out", () {
                        LogOut(context);
                      })
                    ],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    ));
  }
}
