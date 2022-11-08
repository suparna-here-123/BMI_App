// this is the second page of the app.

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});              // required means it makes it compulsory that bmi must be passed.
  double bmi = 0;                               // this means its talking about below mentioned variable.

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Analysis")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //   ElevatedButton(onPressed: (){Navigator.pop(context);},      // .pop() doesn't work in setState because you're not changing the state of anything.
          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text("go back")
          // )),
            //Text("Your BMI is ${widget.bmi}") , // WHILE PASSING PARAMETERS IN A TEXT LINE, YOU HAVE TO SAY WIDGET.PARAMETER ONLY THEN IT WORKS
            Container(
                height: 300,
                width: 500,
                color : Colors.red,
                alignment: Alignment.center,
                child : Text("Your BMI is : ${widget.bmi} ",
                    textAlign: TextAlign.center,
                    style : TextStyle(
                        fontSize: 30,
                        color : Colors.white

                    ))
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.lightBlueAccent,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )


          ],
        ),
      ),
    );
  }
}
