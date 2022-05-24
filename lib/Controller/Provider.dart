// ignore_for_file: prefer_const_constructors, annotate_overrides, non_constant_identifier_names, file_names, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, camel_case_types, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/Constant.dart';
import 'package:e_commerce/Model/Categories.dart';
import 'package:e_commerce/Model/Products.dart';
import 'package:e_commerce/Model/home_data_model.dart';
import 'package:e_commerce/shared/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TextFeild with ChangeNotifier {

  // TextFeild() : super() {
  //   debugPrint('----- I am TextFeild Provider -----');
  //   // GetProduct();
  // }

  // Controller Address
  var name = TextEditingController();
  var region = TextEditingController();
  var city = TextEditingController();
  var details = TextEditingController();
  var notes = TextEditingController();

  //Password Visibility
  bool Hidden = true;

  PassVisiability() {
    Hidden = !Hidden;
    notifyListeners();
  }

  //Add or Color
  var AandD = "ADD";
  var ColorCart = primarycolor;

  BottonCarts() {
    if (AandD == "ADD") {
      AandD = "Delete";
      ColorCart = Colors.red;
      notifyListeners();
    } else {
      AandD = "ADD";
      ColorCart = primarycolor;
      notifyListeners();
    }
  }

  bool isLoading = false;

  HomeDataModel? homeDataModel;

  GetProduct() async {
    try {
      isLoading = true;
      var url = "https://student.valuxapps.com/api/products";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        homeDataModel = HomeDataModel.fromJson(jsonDecode(response.body));
        isLoading = false;
        log(isLoading.toString());
        notifyListeners();
      }
    } on HttpException catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.message);
      // TODO
    }
  }

  GetCategory() async {
    List All = [];
    var url = "https://student.valuxapps.com/api/categories";
    var jsondata = await http.get(Uri.parse(url));
    var jsonbody = jsonDecode(jsondata.body)["data"]["data"];
    for (var i in jsonbody) {
      var Data = ModelCategories.fromjson(i);
      All.add(Data);
    }
    print(All);
    notifyListeners();
    return All;
  }

// Add Address
  Addaddress() async {
    var url = "https://student.valuxapps.com/api/addresses";
    var Token = await CacheHelper.getData(key: "token");
    var response = await http.post(Uri.parse(url), body: {
      "name": "${name.text}}",
      "city": city.text,
      "region": region.text,
      "latitude": "30.0616863",
      "longitude": "31.3260088",
      "details": details.text,
      "notes": notes.text
    }, headers: {
      "Authorization": "$Token"
    });

    var status = jsonDecode(response.body)["status"];
    var resbody = jsonDecode(response.body)["data"];
    print("Add Address === $status");
    return resbody;
  }

// Update Address
  UpdateAddresses(id) async {
    var url = "https://student.valuxapps.com/api/addresses/$id";
    var pref = await SharedPreferences.getInstance();
    var key = "token";
    var Token = pref.getString(key);
    var jsondata = await http.put(Uri.parse(url), body: {
      "name": "${name.text}}",
      "city": city.text,
      "region": region.text,
      "latitude": "30.0616863",
      "longitude": "31.3260088",
      "details": details.text,
      "notes": notes.text
    }, headers: {
      "Authorization": "$Token"
    });

    var jsonbody = jsonDecode(jsondata.body)["data"]["city"];

    var status = jsonDecode(jsondata.body)["status"];

    print("UpdateAddress== $status");
    print("Result $jsonbody");
  }

  String quantity = '';

  Quantity(id, num) async {
    try {
      var url = "https://student.valuxapps.com/api/carts/$id";
      var pref = await SharedPreferences.getInstance();
      var key = "token";
      var Token = pref.getString(key);
      var jsondata = await http.put(Uri.parse(url),
          headers: {"lang": "ar", "Authorization": "$Token"},
          body: {"quantity": num},);

      if(jsondata.statusCode == 200){
        var jsonbody = jsonDecode(jsondata.body)["data"]["cart"]["quantity"];

        quantity = jsonbody;

        await GetCart();
        notifyListeners();

        print("Result= = = = =  = = $jsonbody // $quantity");
      }
    } on HttpException catch (error) {
      // TODO
      log(error.message);
    }
  }

// List<ModelProduct> cartProduct = [];
  ModelProduct? cartProductModel;

  GetCart() async {
    try {
      var url = "https://student.valuxapps.com/api/carts";
      var pref = await SharedPreferences.getInstance();
      var key = "token";
      var Token = pref.getString(key);
      var response = await http.get(
        Uri.parse(url),
        headers: {"lang": "ar", "Authorization": "$Token"},
      );
      if (response.statusCode == 200) {
        cartProductModel = ModelProduct.fromJson(jsonDecode(response.body));
        print(cartProductModel);
      }
    } on HttpException catch (e) {
      log(e.message);
      // TODO
    }
  }


  Future<void> DelCart(id) async {
    var url = "https://student.valuxapps.com/api/carts/$id";
    var pref = await SharedPreferences.getInstance();
    var key = "token";
    var Token = pref.getString(key);
    var response = await http.delete(Uri.parse(url), headers: {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": "$Token"
    });
    var resbody = jsonDecode(response.body)["status"];
    notifyListeners();
    if (resbody == true) {
      print("Delete Item");
      notifyListeners();
    } else {
      print("Failed");
    }
  }


  AddCarts(id)async{
    var url = "https://student.valuxapps.com/api/carts";
    var pref= await SharedPreferences.getInstance();
    var key="token";
    var Token= pref.getString(key);
   try{
     var response = await http.post(Uri.parse(url),body: {
       "product_id" : "$id"
     },headers: {
       "lang":"ar",
       "Authorization":"$Token"
     });
     if(response.statusCode==200){
       var message= jsonDecode(response.body)["message"];
       if (message=="تمت الإضافة بنجاح") {
         print("========AddProv========");
       }
       else {
         print("========DeleteProv========");
       }
     }
   }on HttpException catch (e) {
     log(e.message);
     // TODO
   }
  }
}
