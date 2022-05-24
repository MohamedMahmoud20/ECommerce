// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:e_commerce/Constant.dart';
import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/View/Widgets/Card_Product_Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product_details extends StatefulWidget {
  final name;
  final des;
  final price;
  final image;
  final id;

  Product_details({
    required this.price,
    required this.name,
    required this.id,
    required this.image,
    required this.des});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {

  var IIocn = Icons.favorite_border;
  String AandD = "ADD";
  var ColorB = primarycolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 696,
            child: ListView(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      widget.image,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${widget.name}",
                        style: TextStyle(
                            fontSize: FontMeduimText,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Card_Product_Details(
                          "Size",
                          Text("...",
                              style: TextStyle(
                                  fontSize: FontMeduimText,
                                  fontWeight: FontWeight.w700))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: Fontlargetext,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text("${widget.des}",
                      style: TextStyle(
                          height: 1.3,
                          fontSize: 15,
                          color: primarycolor,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "PRICE",
                                style: TextStyle(fontSize: 15, color: SuvaGrey),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text("\$${widget.price}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: primarycolor,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Consumer<TextFeild>(builder: (BuildContext context, value,
                            Widget? child) {
                          return MaterialButton(
                            height: 50,
                            minWidth: 150,
                            onPressed: () async {
                              value.AddCarts(widget.id);
                              // Login("MoTw1ns123@gmail.com", "aaaAAA111", context);
                             value.BottonCarts();
                            },
                            child:
                            Text(
                              value.AandD,
                              style: TextStyle(color: Colors.white),
                            ),
                            color:value.ColorCart,
                          );
                        },),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
