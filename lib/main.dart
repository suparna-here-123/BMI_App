import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// unable to set height's minimum value to 0 - should initialise variable height to non-zero value also
// how to write mathematical expressions to variables


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 1;
  double weight = 0;
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "BMI CALCULATOR",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50,
                fontWeight : FontWeight.bold
            ),

          )),
      backgroundColor: Colors.yellow,

      body: Column(
        children: [
          Container(
            height: 70,                   // dimensions of the colored box around 'height'
            width:270,
            color: Colors.red,
            alignment: Alignment.bottomLeft,
            child: Text(
                "HEIGHT IN CMS: ${height.round()}",
                textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Slider(                       // when setState() is called, if will rerun the builder widget
              min: 1,
              max: 300,
              value: height,
              onChanged: (val){           // () : input, {} : trigger of the input
                setState(() {
                  height = val;
                });
              }),
          Container(
              height: 50,                   // dimensions of the colored box around 'weight'
              width:270,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                "WEIGHT IN KGS: ${weight.round()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
          Container(                      // to show the weight (changes upon pressing button)    WHY HAVE I DONE THIS TWICE????
            height : 40,
            width: 80,
            color: Colors.green,
            child: Text("${weight.round()}",
            textAlign: TextAlign.center,
            style : TextStyle(
              fontSize: 30,
              color: Colors.white
            ))
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              weight = weight + 1;          // WRITE IF STATEMENT TO ENSURE WEIGHT IS NOT NEGATIVE.
            });
          }, child : Text("+")) ,
          ElevatedButton(onPressed: (){
            setState(() {
              weight = weight - 1;
            });
          }, child: Text('-')),
          Container(
            height: 50,
            width: 300,
            color : Colors.red,
            child : Text("BMI",
            textAlign: TextAlign.center,
            style : TextStyle(
              fontSize: 50,
              color : Colors.white

            ))
          ),
          Container(
            height : 50,
            width: 300,
            color : Colors.green,
            child : Text("${bmi}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),)
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              bmi = (weight/(height * height * 0.0001));
            });
          }, child: Text("Calculate",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white
          ),)
          )
        ],

      )
    );
  }
}
