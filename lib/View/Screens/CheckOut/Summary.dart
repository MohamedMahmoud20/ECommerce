// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constant.dart';

class Summaryy extends StatefulWidget {
  const Summaryy({Key? key}) : super(key: key);

  @override
  State<Summaryy> createState() => _SummaryyState();
}

class _SummaryyState extends State<Summaryy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        FutureBuilder(
          future: GetCart(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              children: [
                (snapshot.hasData)
                    ? SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 5),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 2,
                                borderOnForeground: true,
                                shadowColor: primarycolor,
                                child: SizedBox(
                                  width: 140,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        alignment: Alignment.center,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              "${snapshot.data[index]["product"]["image"]}",
                                              height: 100,
                                              width: 100,
                                            )),
                                      ),
                                      Text(
                                        "${snapshot.data[index]["product"]["name"]}",
                                        style: TextStyle(
                                            fontSize: FontTitlecategory),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8 , top: 5),
                                        child: Text(
                                            "\$${snapshot.data[index]["product"]["price"]}",
                                            style: TextStyle(
                                              fontSize: FontTitlecategory,
                                              color: primarycolor,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Center(child: Text("Loading.....")),
                Container(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Shipping Address",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                Consumer<TextFeild>(builder: (BuildContext context, value, Widget? child) {
                  return  ListTile(
                    title:  Container (
                        padding: EdgeInsets.only(left: 5, right: 50),
                        child: Text(
 "${value.name.text} ,${value.region.text} , ${value.city.text} , ${value.details.text} , ${value.notes.text} ",
                          style: TextStyle(fontSize: 17 , wordSpacing: 2.0 , letterSpacing: 2.0),textScaleFactor: 1,
                        )),
                    trailing:  Icon(
                      Icons.check_circle,
                      color: primarycolor,
                    ),
                  );
                },),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    //
                    //   return Update(notes: null, details: null, city: null, region: null, name: null, id: null);
                    // }));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Change",
                      style: TextStyle(color: primarycolor, fontSize: 15),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    ));
  }
}
