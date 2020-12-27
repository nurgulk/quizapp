import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuizPage.dart';

void gotoQuizPage(BuildContext context){
  Navigator.of(context).push(
  MaterialPageRoute(builder:(context) => QuizPage()),
);

}

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Quiz'),

        ),


        body: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(


              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(

                child: Text(
                  'Merhaba, sınava hoşgeldiniz',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
              onPressed: () {gotoQuizPage(context);},
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ));
  }

  image({NetworkImage image}) {}
}
