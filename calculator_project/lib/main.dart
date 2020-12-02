import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _CalculatorState();
  }
}

class _CalculatorState extends State<MyApp> {
  double num1,num2,result; // Numbers taken from user
  // Using TextEditingControllers to clear text from text fields using the clear button and the suffixIcons
  var _controller= TextEditingController();   // Controller for Number One
  var _controller2= TextEditingController();  // Controller for Number two
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          // backgroundColor: Colors.black,
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text("DSC Calculator Project", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,

          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(     // Wrapped TextField with Expanded widget to prevent it taking infinite space
                        child: TextField(
                          controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          suffixIcon: IconButton(   // This icon is at the end of each TextField to clear its inputs separate from the Clear all button
                            onPressed: (){
                              _controller.clear();
                            },
                            icon: Icon(Icons.clear),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Colors.green, width: 1.5, style: BorderStyle.solid) ),
                          
                          labelText: "Number one",
                          labelStyle: TextStyle(fontSize: 15, color: Colors.black)
                        ),
                      onChanged: (value){
                          setState(() {
                              num1=double.tryParse(value);  // Using tryParse to avoid throwing exceptions
                          });

                      },
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 32,),     // Separates TextField for Number one from two
                  Row(      // Using rows inside columns
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.number,
                          decoration:
                          InputDecoration(
                            suffixIcon: IconButton(       // This icon is at the end of each TextField to clear its inputs separate from the Clear all button
                              onPressed: () {
                                _controller2.clear();
                              },
                            icon: Icon(Icons.clear),
                            ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Colors.green, width: 1.5, style: BorderStyle.solid) ),
                              labelText: "Number two",
                              labelStyle: TextStyle(fontSize: 15, color: Colors.black)
                          ),
                          onChanged: (value){
                            setState(() {
                                num2=double.tryParse(value);    // Using tryParse to avoid throwing exceptions
                            });

                          },
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 25,),    // Separates text fields from buttons
                  Row(        // This row contains buttons to add and subtract the given numbers
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(         // This is the addition button
                        color: Colors.green,
                        child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
                        onPressed: (){
                          setState(() {
                            result= num1+num2;
                          });

                        },
                      ),
                      RaisedButton(         // This is the subtraction button
                        color: Colors.green,
                        child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white),),
                        onPressed: (){
                          setState(() {
                            result= num1-num2;
                          });

                        },
                      ),
                    ],

                  ),
                  Row(      // This row contains buttons to multiply and divide the given numbers
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(       // This is the multiplication button
                        color: Colors.green,
                        child: Text("*", style: TextStyle(fontSize: 20, color: Colors.white),),
                        onPressed: (){
                          setState(() {
                            result= num1*num2;
                          });

                        },
                      ),

                      RaisedButton(             // This is the division button
                        color: Colors.green,
                        child: Text("/", style: TextStyle(fontSize: 20, color: Colors.white),),
                        onPressed: (){
                          setState(() {
                            result= num1/num2;
                          });

                        },
                      ),
                    ],

                  ),
                SizedBox(height: 10,),    // Used to separate mathematical operations buttons from Clear all button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(       // This button clears all text fields
                      padding: EdgeInsets.symmetric(horizontal: 90),
                        color: Colors.green,
                        child: Text("Clear all", style: TextStyle(fontSize: 15, color: Colors.white),),
                        onPressed: () {
                        setState(() {
                          result=0;
                          _controller.clear();
                          _controller2.clear();
                        });


                        }
                        ),
                  ],
                ),
                SizedBox(height: 15,),      // Used to separate Clear all button from the result text

                Text("Result: $result"),

                ],
            ),
          ),
        )

    );
  }
}