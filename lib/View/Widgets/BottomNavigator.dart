// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BottomNavigator extends StatefulWidget {
final ontap;
final index;
const BottomNavigator({this.ontap , this.index});
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.ontap,
      currentIndex: widget.index,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            activeIcon: Text(
              "Explore",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,color: Colors.blue),
            ),
            icon: Text(
              "Explore",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            label: ""),
        BottomNavigationBarItem(
            activeIcon:
            SvgPicture.asset("assets/icon/Icon_Cart.svg",color: Colors.blue,height: 25,),
            label: "", icon:
        SvgPicture.asset("assets/icon/Icon_Cart.svg")),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icon/Icon_User.svg",color: Colors.blue,height: 25,),
            icon: SvgPicture.asset("assets/icon/Icon_User.svg"),
            label: ""),
      ],
    );
  }
}
