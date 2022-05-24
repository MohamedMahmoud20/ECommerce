import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/View/Authentication/Signin_Screen.dart';
import 'package:e_commerce/shared/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/Screens/Home_Screen/Bottom_Navigator.dart';

class ControlView extends StatefulWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {

  String? token;

  ReadP() async {
    token = await CacheHelper.getData(key:"token");
    print(token);

    // if (Token !="0" && Token !=null) {
    //   print("ReaMain =====$Token");
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(
    //           builder: (BuildContext context) {
    //             return Home_Screen();
    //           }
    //       ), (route) => false);
    // } else if(Token==null) {
    //   print("Main Null");
    // }
  }

  // @override
  // void initState() {
  //   ReadP();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return myHome();
    // return token != null ? Home_Screen()
    // : Signin();
  }
  Widget myHome(){
   String? token =  CacheHelper.getData(key:"token");
    if(token != null){
      return Home_Screen();
    }else{
      return Signin();
    }
  }
}
