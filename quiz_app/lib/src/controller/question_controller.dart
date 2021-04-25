import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/src/controller/question.dart';
import 'package:quiz_app/src/ui/score_page.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  String _userName;
  String get userName => this._userName;

  set userName(String name) {
    this._userName = name;
  }

  AnimationController _animationController;

  Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numberOfCorrectAnswer = 0;
  int get numberOfCorrectAnswer => _numberOfCorrectAnswer;

  List<Question> _questions = questionList
      .map((q) => Question(
            id: q['id'],
            question: q['question'],
            options: q['options'],
            answer: q['correct_answer'],
          ))
      .toList();
  List<Question> get questions => this._questions;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numberOfCorrectAnswer++;
    }

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => ScorePage());
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
