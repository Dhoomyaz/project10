// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';


class Counter extends StatelessWidget {

  int cmp;
  int alltasks;
Counter ( {required this.cmp, required this.alltasks,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        "$cmp/$alltasks",
        style: TextStyle(
            fontSize: 50,
             color: 
            cmp==alltasks? Colors.green:Colors.blueGrey,
             fontWeight: FontWeight.w500),
      ),
    );
  }
}
