import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Service/Question.dart';
import 'package:quizapp/Service/QuizManager.dart';
import 'package:quizapp/Screens/ResultPage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizManager _manager = QuizManager();

  List<Widget> getOptions(Question question) {
    List<Widget> optionButton = [];
    for (int i = 0; i < question.options.length; i++) {
      optionButton.add(
        RaisedButton(
          onPressed: () {
            _manager
                .nextQuestion(_manager.getCurrentQuestion().options[i].score);
            if (_manager.isFinished()) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ResultPage(score : _manager.getTotalScore())));
            }
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${_manager.getCurrentQuestion().options[i].text}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
    }
    return optionButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Questions ${_manager.getCurrentId()}/${_manager.totalQuestionNum()}'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    '${_manager.getCurrentQuestion().text}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getOptions(_manager.getCurrentQuestion()),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
