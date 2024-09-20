import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceContainer extends StatelessWidget {

  final String deviceName;
  final String iconPath;
  final bool powerOn;
  Function(bool)? onChanged;
  
  


  SmartDeviceContainer({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[800]: Colors.grey[200],
          borderRadius: BorderRadius.circular(20)
          
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 65,
              color: powerOn ? Colors.white : Colors.black, //Change color of image- if turn off black. -if turn on white
            ),

            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(deviceName, 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: powerOn ? Colors.white : Colors.black,
                      ),),
                    )),
                Transform.rotate(
                  angle: pi/2,
                  child: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      value: powerOn, 
                      onChanged: onChanged, ),
                  ))
              ],
            ),

          ],
        ),
      ),
    ) ;
  }
}