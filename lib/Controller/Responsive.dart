import 'package:flutter/material.dart';
class Layout extends StatelessWidget {
  final mobilewidget;
  final websitewidget;
  final tabletWidget;

  Layout({@required this.mobilewidget, this.tabletWidget, this.websitewidget});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1200) {
            return websitewidget ?? mobilewidget;
          }
          else if (constraints.maxWidth >= 800) {
            return tabletWidget ?? mobilewidget;
          }
          else {
            return mobilewidget;
          }
        });
  }
}