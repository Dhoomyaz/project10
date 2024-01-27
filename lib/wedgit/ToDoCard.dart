// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String name;
  final bool state;
  Function changeState;
  Function deletetask;

  int p;
  ToDoCard(
      {super.key,
      required this.name,
      required this.state,
      required this.changeState,
      required this.p,
      required this.deletetask});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeState(p);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  Icon(
                    state ? Icons.check : Icons.close,
                    size: 27,
                    color: state ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  IconButton(
                    onPressed: () {
                      deletetask(p);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),

            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
