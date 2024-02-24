import 'package:subhaa/quizscreen.dart';
import 'package:flutter/material.dart';
import 'package:subhaa/quizscreen.dart';
class ResultPage extends StatelessWidget {
  ResultPage({required this.score});
  int score=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      "Score",
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 40,
                      )
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                      "$score/10",
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 40,
                      )
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed:(){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder:(context)=>Quizscreen()
                          ),
                        );
                      },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

                  ),
                      child: Center(
                        child: Text(
                          'RE-PLAY',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

                      ),
                      child: Center(
                        child: Text(
                          'EXIT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ))
                ],
              ),
            )
        )
    );
  }
}