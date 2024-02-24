import 'package:subhaa/answer_page.dart';
import 'package:subhaa/quizhelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  Uri apiUrl=Uri.parse('https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple');
  late QuizHelper quizHelper;
  int elapsedSeconds=0;
  int totalTime=10;
  int currentQuestion=0;
  int score=0;
  late Timer timer;
  initTimer(){
    timer=Timer.periodic(
        Duration(seconds:1,
        ) ,(t){
      if(t.tick==totalTime){
        print("objecttime completd");
        changeQuestion();
      }
      else
      {
        setState(() {
          elapsedSeconds=t.tick;
        });
      }
    }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
  @override
  void initState()
  {
    fetchQuiz();
    super.initState();
  }
  fetchQuiz() async {
    var response = await http.get(apiUrl);
    var body = response.body;
    var json = jsonDecode(body);
    setState(() {
      quizHelper = QuizHelper.fromJson(json);
      quizHelper.results[currentQuestion].incorrectAnswers.add(
          quizHelper.results[currentQuestion].correctAnswer
      );
      quizHelper.results[currentQuestion].incorrectAnswers.shuffle();
      initTimer();
    });
  }
  changeQuestion()async{
    timer.cancel();
    if(quizHelper.results.length-1==currentQuestion)
    {
      print("quiz completed");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>ResultPage(score: score,))
      );

    }
    else{
      setState(() {
        currentQuestion++;
        quizHelper.results[currentQuestion].incorrectAnswers.add(
            quizHelper.results[currentQuestion].correctAnswer
        );
        quizHelper.results[currentQuestion].incorrectAnswers.shuffle();

      });
      initTimer();
    }
  }
  checkAnswer(answer){
    if(quizHelper.results[currentQuestion].correctAnswer==answer){
      print("correct answer");
      score++;
    }
    else{
      print("incorrect answer");
    }
    changeQuestion();
  }
  @override
  Widget build(BuildContext context) {
    if(quizHelper!=null) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'QUIZ',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          elapsedSeconds.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    quizHelper.results[currentQuestion].question,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: quizHelper.results[currentQuestion].incorrectAnswers
                      .map((e) =>
                  new Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      onPressed: () {checkAnswer(e);},
                      style: ElevatedButton.styleFrom(

                      ),
                      child: Container(
                        height: 60,
                        width: 300,
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  ).toList(),
                )
              ],
            ),
          ),
        ),
      );
    }
    else
    {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
