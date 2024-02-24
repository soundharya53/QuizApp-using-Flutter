import 'package:subhaa/quizscreen.dart';
import 'package:subhaa/quizscreen1.dart';
import 'package:subhaa/quizscreen2.dart';
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizCategoryPage()),
                    );
                  }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

              ),
                  child: Center(
                    child: Text(
                      'START QUIZ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ))


            ],
          ),
        ),
      ),
    );
  }
}
class QuizCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context)=>Quizscreen()
                  ),
                );
              }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

            ),
                child: Center(
                  child: Text(
                    'Computer Science',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                )
            ),
            SizedBox(
              height:50,
            ),

            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context)=>Quizscreen2()
                  ),
                );
              }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

            ),
                child: Center(
                  child: Text(
                    'Sports',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context)=>Quizscreen1()
                  ),
                );
              }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal:50,vertical: 10),

            ),
                child: Center(
                  child: Text(
                    'Histroy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}