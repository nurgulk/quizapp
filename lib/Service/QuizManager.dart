import 'package:quizapp/Service/Option.dart';
import 'package:quizapp/Service/Question.dart';
import 'Question.dart';
import 'Option.dart';


class QuizManager {
  QuizManager() {
    _questions.add(Question("Türkiye'nin başkenti neresidir?", [
      Option('Ankara', 10),
      Option('İstanbul', 5),
      Option('Tokyo', 0),
      Option('Fransa', -5),
    ]));
    _questions.add(Question("Fransa'nın başkenti neresidir?", [
      Option('Paris', 10),
      Option('Milano', 5),
      Option('Lens', 0),
      Option('Türkiye', -5),
    ]));
    _questions.add(Question("İngiltere'nin başkenti neresidir?", [
      Option('Londra', 10),
      Option('Leeds', 5),
      Option('İstanbul', 0),
      Option('Afrika', -5),
    ]));
    _questions.add(Question("İngiltere'nin başkenti neresidir?", [
      Option('Londra', 10),
      Option('Leeds', 5),
      Option('İstanbul', 0),
      Option('Afrika', -5),
    ]));

  _questions.shuffle();
  for (var question in _questions) {
    question.options.shuffle();
  }
}
  List<Question> _questions = [];
  int _score = 0;
  int currentQuestionId = 0;

  void nextQuestion(score) {

    if (currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
    print(currentQuestionId);
  }
  int getTotalScore()=> _score;
  int getCurrentId() => currentQuestionId ;
  int totalQuestionNum() => _questions.length;

  bool isFinished() {
    return currentQuestionId >= _questions.length;
  }

  Question getCurrentQuestion() {
    print('getCurrentQuestion $currentQuestionId');
    if (currentQuestionId < _questions.length) {
      return _questions[getCurrentId()];
    } else {
      return Question('', []);
    }
  }
}
