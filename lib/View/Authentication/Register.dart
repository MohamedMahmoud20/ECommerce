// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'package:e_commerce/View/Widgets/CardRegister.dart';
import 'package:flutter/material.dart';

class Register_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(bottomOpacity: 200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets. only(left: 10),
          child: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
      ),
      body: CardRegister(),
    );
  }
}
