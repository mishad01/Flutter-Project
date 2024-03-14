import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;

  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbR = FirebaseDatabase.instance.ref();

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: powerOn ? Colors.grey[900] : Color.fromARGB(44, 164, 167, 189),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.width *
            0.3, // Adjust the height as needed
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Expanded(
                child: Image.asset(
                  iconPath,
                  width: MediaQuery.of(context).size.width *
                      0.3, // Adjust the height as needed
                  color: powerOn ? Colors.white : Colors.grey.shade700,
                ),
              ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Text(
                      smartDeviceName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width *
                            0.04, // Adjust the font size as needed
                        color: powerOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: (newValue) {
                        onChanged?.call(newValue);
                        dbR.child("Light").set({"Switch": newValue});
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
