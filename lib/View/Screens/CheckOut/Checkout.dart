// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, use_key_in_widget_constructors, file_names

import 'package:e_commerce/View/Screens/CheckOut/Delivery.dart';
import 'package:e_commerce/View/Screens/CheckOut/Summary.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'AddreSs/Address.dart';

class CheckOut extends StatefulWidget {

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _Controller = PageController(initialPage: 0);
  var PageIndex = 0;
  String Next = "Next";
  bool Backvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 10, bottom: 50),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_outlined)),
              SizedBox(
                width: 100,
              ),
              Center(
                  child: Text(
                "Checkout",
                style: TextStyle(fontSize: 20),
              ))
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _Controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: ScrollingDotsEffect(
              dotWidth: 25,
              spacing: 100,
              dotHeight: 25,
              dotColor: Colors.grey,
              activeDotColor: Colors.green,
              activeDotScale: 1.5,
              activeStrokeWidth: 2,
              fixedCenter: true),
        ),
        SizedBox(
          height: 450,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                PageIndex = index;
              });
            },
            pageSnapping: true,
            controller: _Controller,
            children: [
              Delivery(),
              Address(),
              Summaryy(),
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (Backvisible == true) ? Bacck() : Text(""),
            Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (PageIndex < 1) {
                      _Controller.animateToPage(PageIndex + 1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                      Backvisible=true;
                    } else if (PageIndex == 0) {
                      _Controller.animateToPage(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                      setState(() {
                        Next = "Deliver";
                      });
                      print("Done");
                    }
                    else if(PageIndex==0) {
                      Backvisible = false;
                    }
                    else{
                      _Controller.animateToPage(2,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                      setState(() {
                        Next = "Deliver";
                      });
                      print("Done");
                    }
                  },
                  child: Text(Next, style: TextStyle(color: Colors.white)),
                )),
          ],
        ))
      ],
    ));
  }

  Widget Bacck() {
    return Container(
        width: 150,
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border(
                left: BorderSide(color: Colors.green),
                right: BorderSide(color: Colors.green),
                top: BorderSide(color: Colors.green),
                bottom: BorderSide(color: Colors.green))),
        child: MaterialButton(
          onPressed: () {
            if (PageIndex > 1) {
              if (PageIndex == 2) {
                setState(() {
                  Next = "Next";
                });
              }
              _Controller.animateToPage(--PageIndex,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              print(PageIndex);
            } else if (PageIndex == 1) {
              _Controller.animateToPage(0,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              Backvisible = false;
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text("Back", style: TextStyle(color: Colors.green)),
        ));
  }
}
