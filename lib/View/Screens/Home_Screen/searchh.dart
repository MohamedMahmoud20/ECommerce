// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/View/Screens/Product_Details/Product_Details.dart';
import 'package:flutter/material.dart';
import '../../../Constant.dart';

class SearcH extends StatefulWidget {

  final Textt;
  const SearcH(this.Textt);

  @override
  State<SearcH> createState() => _SearcHState();
}

class _SearcHState extends State<SearcH> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("Result"),
    ),
        body:
    FutureBuilder(
      future: Search(widget.Textt),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return (snapshot.hasData)?
        GridView.builder(
            itemCount: snapshot.data.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(right: 10, left: 10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.55),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                        return Product_details(
                          name: snapshot.data[index].name,
                          des: snapshot.data[index].description,
                          price: snapshot.data[index].price,
                          image: snapshot.data[index].image,
                          id: snapshot.data[index].id,
                        );
                      }));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:
                        Image.network("${snapshot.data[index].image}" ,
                          height: 200
                          ,width: 200,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${snapshot.data[index].name}",
                      style: TextStyle(fontSize: FontTitlecategory ) , maxLines: 2,),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$${snapshot.data[index].price}",
                      style: TextStyle(
                          fontSize: FontTitlecategory, color: primarycolor),
                    ),
                  ],
                ),
              );
            })
            :Center(child: CircularProgressIndicator(),);
      },
    ));
  }
}