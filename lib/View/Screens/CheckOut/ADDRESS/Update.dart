// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, annotate_overrides

import 'package:e_commerce/Constant.dart';
import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Update extends StatefulWidget {
  final id;

  // ignore: prefer_const_constructors_in_immutables
  Update({this.id});

  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(body:
      Consumer<TextFeild>(builder: (BuildContext context, value, Widget? child) {
        return     Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 30, right: 10, left: 10),
                  child:
                      TextFiield("Name", 15.0, value.name)),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child:
                            TextFiield("Region", 15.0, value.region)),
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child:
                            TextFiield("City", 15.0, value.city)),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child:
                      TextFiield("Details Address", 15.0, value.details)),
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child:
                      TextFiield("Notes", 15.0, value.notes)),
              MaterialButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  UpdateAddresses(value.name.text, value.region.text, value.city.text,
                      value.details.text, value.notes.text , widget.id);
                },
                child:
                Text("Update" , style: TextStyle(color: Colors.white),),
                color: primarycolor,
              )
            ]);

      },)
      ,);
  }
}
