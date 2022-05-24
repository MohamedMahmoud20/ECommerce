// ignore_for_file: prefer_const_constructors, file_names, avoid_print


import 'package:e_commerce/Constant.dart';
import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Update.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  var iconn = Icons.check_circle_outline;
  var test = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TextFeild>(builder: (BuildContext context, value, Widget? child) {
        return ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  iconn,
                  color: primarycolor,
                ),
                Text(
                  "Billing address is the same as delivery address",
                  style: TextStyle(fontSize: FontTitlecategory),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: TextFiield("Name", 15.0,value.name)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: TextFiield("Region", 15.0,value.region)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: TextFiield("City", 15.0, value.city)),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: TextFiield("Details Address", 15.0, value.details)),
                Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: TextFiield("Notes", 15.0, value.notes)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: FutureBuilder(
                        future: Addaddress(
                            value.name.text,
                            value.region.text,
                            value.city.text,
                            value.details.text,
                            value.notes.text),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return Update(
                                            id :(snapshot.data["id"]== null)?"0" :snapshot.data["id"]
                                        );
                                      }));
                                },
                                child: Text("Update"),
                                color: Colors.red,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    (test == true)
                        ? SizedBox(
                      height: 40,
                      width: 90,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {

                          Addaddress(value.name.text,
                              value.region.text, value.city.text,
                              value.details.text, value.notes.text);
                          setState(() {
                            test = false;
                            iconn = Icons.check_circle;
                            print("Done");
                          });
                        },
                        child: Text("Done"),
                        color: primarycolor,
                      ),
                    ) : Text("")
                  ],
                )
              ],
            )
          ],
        );
      },)
    );
  }
}