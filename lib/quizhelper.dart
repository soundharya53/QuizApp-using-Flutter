import 'package:flutter/material.dart';
import 'package:http/http.dart';
class QuizHelper {

  int responseCode=0;

  List<Results> results=[];
  QuizHelper({required this.responseCode, required this.results}) {
    // TODO: implement QuizHelper
    throw UnimplementedError();
  }

  QuizHelper.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {

      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String type="";
  String difficulty="";
  String category="";
  String question="";
  String correctAnswer="";
  List<String> incorrectAnswers=[""];

  Results(
      {required this.type,
        required this.difficulty,
        required this.category,
        required this.question,
        required this.correctAnswer,
        required this.incorrectAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    difficulty = json['difficulty'];
    category = json['category'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['category'] = this.category;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.incorrectAnswers;
    return data;
  }
}






