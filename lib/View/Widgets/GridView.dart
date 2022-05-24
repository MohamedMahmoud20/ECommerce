// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors

import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/View/Screens/Product_Details/Product_Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constant.dart';

class GridViewProduct extends StatefulWidget {
  @override
  State<GridViewProduct> createState() => _GridViewProductState();
}

class _GridViewProductState extends State<GridViewProduct> {
  var ico = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Consumer<TextFeild>(
      builder: (BuildContext context, value, Widget? child) {
        return (value.isLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.homeDataModel!.data!.productData!.length,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(right: 10, left: 10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Product_details(
                          name:
                          value.homeDataModel!.data!.productData![index].name,
                          des:
                          value.homeDataModel!.data!.productData![index].description,
                          price:
                          value.homeDataModel!.data!.productData![index].price,
                          image:
                          value.homeDataModel!.data!.productData![index].image,
                          id:
                          value.homeDataModel!.data!.productData![index].id,
                        );
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              "${value.homeDataModel!.data!.productData![index].image}",
                              height: 200,
                              width: 200,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${value.homeDataModel!.data!.productData![index].name}",
                          style: TextStyle(fontSize: FontTitlecategory),
                          maxLines: 2,
                        ),
                        Text(
                          "${value.homeDataModel!.data!.productData![index].price}",
                          style: TextStyle(
                              fontSize: FontTitlecategory, color: primarycolor),
                        ),
                      ],
                    ),
                  );
                });
      },
    );
  }
}