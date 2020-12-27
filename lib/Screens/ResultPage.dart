import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key,this.score}):super(key:key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CircleAvatar(

            child: Image.asset('assets/success.png',width: 500, height: 500),
          ),
          Text('Congrats Your score:', style: TextStyle(fontSize:30)),
          Text('${widget.score}',
          style: TextStyle(fontSize:30,fontWeight: FontWeight.w900),
    ),
        ],
      ),
    );
  }
}
