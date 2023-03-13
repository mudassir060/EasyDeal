// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserDataField extends StatelessWidget {
  IconData icon;
  String titleText;
  String text;

  UserDataField(
      {required this.icon, required this.titleText, required this.text});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
                size: 40,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                // width: MediaQuery.of(context).size.width /   1.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}