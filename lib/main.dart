// ignore_for_file: use_key_in_widget_constructors, avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'package:e_commerce/control_view.dart';
import 'package:e_commerce/shared/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/Provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(
    ChangeNotifierProvider<TextFeild>(
      create: (BuildContext context) {
        return TextFeild()..GetProduct().. GetCart();
      },
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
        }                                                                                                                                                                                                                                                                       ,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControlView();
  }
}
