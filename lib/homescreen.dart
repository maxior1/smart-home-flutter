import 'package:flutter/material.dart';
import 'package:smart_home/smart_device_container.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //padding and color text
  final double horizontalPadding=30;
  final double verticalPadding=15;
  final Color? smallText = Colors.grey[800];

  //list smart home

  List smartHomeDevice=[
    ["Smart Door","assets/imgs/opened-door-aperture.png", true],
    ["Smart Light","assets/imgs/light-bulb.png", true],
    ["Smart DTV","assets/imgs/smart-tv.png", true],
    ["Smart Air","assets/imgs/air-conditioner.png", false],
  ];

  //method for switch Button
  void powerSwitchChanged(bool value, int index){
    setState((){
      smartHomeDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  //App bar customize
                  Image.asset("assets/imgs/more.png",
                  width: 35,
                  color: Colors.grey[900],
                  ),
              
                  Image.asset("assets/imgs/user.png",
                  width: 35,),
                  
              
                ],
              ),
            ),

          
            const SizedBox(
                    height: 15,
                  ),
          
          //=============Text welcom
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,",
                  style: TextStyle(
                    fontSize: 14,
                    color: smallText,
                  ),),
                  const Text("Maxio Rush", 
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    
                  ),),
                ],
              ),
            ),
            
            const SizedBox(
                    height: 15,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.grey[500],
                thickness: 1,
              ),
            ),
            const SizedBox(
                    height: 15,
                  ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Home Controller",
              style: TextStyle(
                fontSize: 15,
                color: smallText,
                fontWeight: FontWeight.w500
              ),),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: smartHomeDevice.length,
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                  ), 
                itemBuilder: (context,index){
                  return SmartDeviceContainer(
                    deviceName: smartHomeDevice[index][0],
                    iconPath: smartHomeDevice[index][1],
                    powerOn: smartHomeDevice[index][2],
                    onChanged: (value)=> powerSwitchChanged(value,index),
                  );
                })),


          ],

      )),
    );
  }
}