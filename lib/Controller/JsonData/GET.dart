// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, file_names, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/Model/Categories.dart';
import 'package:e_commerce/Model/ModelGetAddress.dart';
import 'package:e_commerce/Model/Products.dart';
import 'package:e_commerce/Model/ModelSearch.dart';
import 'package:e_commerce/View/Authentication/Signin_Screen.dart';
import 'package:e_commerce/View/Screens/Home_Screen/Bottom_Navigator.dart';
import 'package:e_commerce/shared/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



GetProfile () async{
  var url= "https://student.valuxapps.com/api/profile";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var jsondata= await http.get(Uri.parse(url) ,
      headers: {
    "lang":"ar",
    "Content-Type":"application/json",
    "Authorization":"$Token"
  });
  var jsonbody=jsonDecode(jsondata.body)["data"];
 return jsonbody;

}


GetCart () async{
  var url= "https://student.valuxapps.com/api/carts";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var jsondata= await http.get(Uri.parse(url) ,
      headers: {
    "lang":"ar",
    "Authorization":"$Token"
  });

  var jsonbody=jsonDecode(jsondata.body)["data"]["cart_items"];
 return jsonbody;
}
GetTotal (context) async{
  var url= "https://student.valuxapps.com/api/carts";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var jsondata= await http.get(Uri.parse(url) ,
      headers: {
    "lang":"ar",
    "Authorization":"$Token"
  });

  var jsonbody=jsonDecode(jsondata.body)["data"]["total"];
return jsonbody;
}

AddCarts(context , id)async{
  var url = "https://student.valuxapps.com/api/carts";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var response = await http.post(Uri.parse(url),body:
  {
    "product_id" : "$id"
  },headers: {
    "lang":"ar",
    "Authorization":"$Token"
  });
  var message= jsonDecode(response.body)["message"];
   if (message=="تمت الإضافة بنجاح") {
     print("========AddProv========");
   }
   else {
     print("========DeleteProv========");
   }
}

// Future<void> DelCart(context , id) async{
//   var url = "https://student.valuxapps.com/api/carts/$id";
//   var pref= await SharedPreferences.getInstance();
//   var key="token";
//   var Token= pref.getString(key);
//   var response = await http.delete(Uri.parse(url),
//       headers: {
//     "lang":"ar",
//         "Content-Type":"application/json",
//
//         "Authorization":"$Token"
//   });
//   var resbody= jsonDecode(response.body)["status"];
//   if(resbody==true){
//     print("Delete Item");
//   }
//   else{
//     print("Failed");
//   }
// }



Search(Text)async{
  List All=[];
  var url = "https://student.valuxapps.com/api/products/search";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var response = await http.post(Uri.parse(url),body: {
    "text": "$Text"
  }, headers: {
    "Authorization":"$Token"
  });

  var resbody= jsonDecode(response.body)["data"]["data"];
  for(var i in resbody){
    var Data=  ModelSearch.fromjson(i);
    All.add(Data);
  }
  return All;
}









// Quantity(id , num )async{
//   var url= "https://student.valuxapps.com/api/carts/$id";
//   var pref= await SharedPreferences.getInstance();
//   var key="token";
//   var Token= pref.getString(key);
//   var jsondata= await http.put(Uri.parse(url),
//       headers: {
//         "lang":"ar",
//         "Authorization":"$Token"
//       },
//     body: {
//       "quantity": num
//     }
//   );
//   var jsonbody=jsonDecode(jsondata.body)["data"]["cart"]["quantity"];
//
//     print("Result= = = = =  = = $jsonbody");
//   return jsonbody;
//
// }















Addaddress(name , region , city , details , notes )async{
  var url = "https://student.valuxapps.com/api/addresses";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var response = await http.post(Uri.parse(url),
      body:
  {
    "name": "$name",
    "city": "$city",
    "region": "$region",
    "latitude": "30.0616863",
    "longitude": "31.3260088",
    "details": "$details",
    "notes": "$notes"
  },
      headers:
  {
    "Authorization":"$Token"
  });

  var status= jsonDecode(response.body)["status"];
  var resbody= jsonDecode(response.body)["data"];
  print("Add Address === $status");
  return resbody;
}

GetAddresses () async{
  List All=[];
  var url= "https://student.valuxapps.com/api/addresses";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var jsondata= await http.get(Uri.parse(url) ,
      headers: {
        "lang":"ar",
        "Authorization":"$Token"
      });

  var jsonbody=jsonDecode(jsondata.body)["data"]["data"];
  var status=jsonDecode(jsondata.body)["status"];
  print("GetAddress== $status");
  print(jsonbody);

  for(var i in jsonbody){
    var X = ModelGetAddress.fromjson(i);
    All.add(X);
  }
  return All;
}

UpdateAddresses (name , region , city , details , notes , id ) async{
  var url= "https://student.valuxapps.com/api/addresses/$id";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var jsondata= await http.put(Uri.parse(url) ,
      body:
      {
        "name": "$name",
        "city": "$city",
        "region": "$region",
        "latitude": "30.0616863",
        "longitude": "31.3260088",
        "details": "$details",
        "notes": "$notes"
      },
      headers: {
        "Authorization":"$Token"
      });

  var jsonbody=jsonDecode(jsondata.body)["data"]["city"];

  var status=jsonDecode(jsondata.body)["status"];

  print("UpdateAddress== $status");
  print("Result $jsonbody");
}

DelAddress()async{
  var url = "https://student.valuxapps.com/api/addresses/1480";
  var pref= await SharedPreferences.getInstance();
  var key="token";
  var Token= pref.getString(key);
  var response = await http.delete(Uri.parse(url),
      headers: {
        "lang":"ar",
        "Content-Type":"application/json",

        "Authorization":"$Token"
      });
  var resbody= jsonDecode(response.body)["status"];
  if(resbody==true){
    print("Delete Address");
  }
  else{
    print("Failed");
  }
}


Register(name, Email, phone, password, context) async {
  var url = "https://student.valuxapps.com/api/register";
  var response = await http.post(Uri.parse(url), body: {
    "name": name,
    "phone": phone,
    "email": Email,
    "password": password
  });
  var resbody = jsonDecode(response.body)["data"];
  if (resbody != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Register Successful")));
    Navigator.of(context).pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Register Failed")));
    print(resbody);
  }
}
Login(Email, password, context) async {
  var url = "https://student.valuxapps.com/api/login";
  var response = await http
      .post(Uri.parse(url),
      body: {"email": Email, "password": password});

  var resbody = jsonDecode(response.body)["status"];
  var Token = jsonDecode(response.body)["data"]["token"];
  if (resbody==true) {
    SaveP(Token);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 900),
        content: Text("Sign in Successful")));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Home_Screen();
    }));
    print("Successfully 2");
    ReadP();
  }
  else if (Token==null) {
    print("NULL");
  }
}
LogOut(context) async {
  var url = "https://student.valuxapps.com/api/logout";
  var pref = await SharedPreferences.getInstance();
  var key = "token";
  var Token = pref.getString(key);
  var response = await http.post(Uri.parse(url), headers: {
    "lang": "ar",
    "Content-Type": "application/json",
    "Authorization": "$Token"
  });
  var resbody = jsonDecode(response.body)["status"];
  if (resbody == true) {
    print("LogOut");
    SaveP("0");
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar( duration: Duration(milliseconds: 900),content: Text("Sign in Successful")));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
          return Signin();
        }), (route) => false);
  } else {
    print("LogOut");
  }
}
editProfile(name, Email, phone, password, context) async {
  var url = "https://student.valuxapps.com/api/update-profile";
  var pref = await SharedPreferences.getInstance();
  var key = "token";
  var Token = pref.getString(key);
  var response = await http.put(Uri.parse(url),
      body: {"name": name, "email": Email, "phone": phone},
      headers: {"lang": "ar", "Authorization": "$Token"});
  var resbody = jsonDecode(response.body)["data"];
  if (resbody != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        content: Text("Update Successful")));
    Navigator.of(context).pop();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        content: Text("Update Failed")));
    print(resbody);
  }
}

SaveP(String token) async {
  var pref = await SharedPreferences.getInstance();
  var key = "token";
  pref.setString(key, token);
}
ReadP() async {
  String Token =  CacheHelper.getData(key:"token");
  if (Token != "0") {
    print("ReadMain = $Token");
  } else {
    print("Failed");
  }
}

Widget LISTTILE(image, title, ontap) {
  return GestureDetector(
    onTap: ontap,
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      leading: SvgPicture.asset(
        image,
        height: 25,
        width: 25,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 17,
          )),
    ),
  );
}

TextFeidPass(pass, Contr) {
  return  Consumer<TextFeild>(builder:
      (BuildContext context, value, Widget? child) {
    return  Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 35),
      child: TextField(
          controller: Contr,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: pass,
            labelStyle: TextStyle(fontSize: 20),
            suffixIcon: IconButton(
                onPressed: () {
                  value.PassVisiability();
                },
                icon: Icon(value.Hidden ? Icons.visibility : Icons.visibility_off))

            ,),
        obscureText: value.Hidden,
      ),
    );
  }
  );
}
TextFiield(Title, font , Controller) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15, bottom: 25),
    child: TextFormField(
      controller: Controller,
      style: TextStyle(fontSize: font),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: Title,
        labelStyle: TextStyle(fontSize: font),
      ),
    ),
  );
}
