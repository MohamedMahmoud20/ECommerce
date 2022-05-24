// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/View/Screens/Home_Screen/searchh.dart';
import 'package:e_commerce/View/Widgets/GridView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constant.dart';


class Explore extends StatefulWidget {


  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  @override
  void initState() {
    ReadP();
    super.initState();
  }
  var TexT= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFeild>
      (builder: (BuildContext context, value, Widget? child) {
      return ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40, top: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  child: TextField(
                      controller: TexT,
                      onSubmitted: (v){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return SearcH(TexT.text);
                        }));
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
                      )),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20 , bottom: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold ),
                )),
          ),

          CarouselSlider(
              items: [
                Image.asset("assets/icon/16301438353uCFh.29118.jpg"),
                Image.asset("assets/icon/16445270619najK.6242655.jpg"),
                Image.asset("assets/icon/1630142480dvQxx.3658058.jpg"),
                Image.asset("assets/icon/1644527120pTGA7.clothes.png"),
              ],
              options: CarouselOptions(
                height: 180,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration:
                Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOutQuint,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 20, top: 40, left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Selling",
                  style: TextStyle(
                      fontSize: FontMeduimText, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    value.GetProduct();
                  },
                  child: Row(
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(
                            fontSize: Fonttextbottom,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 15)
                    ],
                  ),
                )
              ],
            ),
          ),
        GridViewProduct()
        ],
      );
    },);
  }
}