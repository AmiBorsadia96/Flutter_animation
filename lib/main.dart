import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home :myapp()

    );
  }
}
class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    this._controller=AnimationController(duration: const Duration(seconds: 10),vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final rotateAnimation=Tween<double>(begin: 0,end: pi).animate(this._controller);
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialogW(context),
        );
      }
    });
    return Scaffold(

      body:Padding(
        padding:EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:Column(

          children: [
            Align(
              alignment: Alignment.topCenter,
              child:
              Text('North',
                textDirection:TextDirection.ltr,
                textWidthBasis: TextWidthBasis.longestLine,
                style: TextStyle(

                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    color:Colors.black,
                    backgroundColor: Colors.lightGreen[200]),
              ),
            ),SizedBox(height: 170.0,),
            Row(
              children:[
              RotatedBox(
                quarterTurns: -1,
                child:Text('East',
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      color:Colors.black,
                      backgroundColor: Colors.lightGreen[200]),
                ),
              ),
            SizedBox(width: 20.0,),
            AnimatedBuilder(
              animation: rotateAnimation,
              builder: (context,child){
                return Transform.rotate(
                  angle: rotateAnimation.value,
                  child: child,
                );
              },

              child: GestureDetector(
              onTap: (){
                _controller.forward();
              },
                child: Image.asset('assets/1.jpeg',
                width: 200.0,),
            ),

            ),

            SizedBox(width: 12,),
            Align(
              alignment: Alignment.topRight,
              child:
              RotatedBox(
                quarterTurns: 1,
                child:Text('West',
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      color:Colors.black,
                      backgroundColor: Colors.lightGreen[200]),
                ),
              ),
            ),
              ],
            ),
            SizedBox(height: 200.0,),
            Align(
              alignment: Alignment.bottomCenter,
              child:
              Text('South',
                textDirection:TextDirection.ltr,
                textWidthBasis: TextWidthBasis.longestLine,
                style: TextStyle(

                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    color:Colors.black,
                    backgroundColor: Colors.lightGreen[200]),
              ),
            ),

          ],
      ),
    ),

    );
  }
}

Widget _buildPopupDialogW(BuildContext context) {
  return new AlertDialog(
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("State-C"),
            Text(
            "Pen is pointing to West direction"),
  
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Ok'),
      ),
    ],
  );
}
