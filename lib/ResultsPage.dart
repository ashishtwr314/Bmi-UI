import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.resultText,
      @required this.interpretationText});

  final String resultText;
  final String bmi;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "YOUR RESULT",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Card(
                  cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    bmi ?? "",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      interpretationText != null ? interpretationText : "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            child: FlatButton(
              color: Color(0xFFff0367),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Calculate Again"),
            ),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  Card({this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF15193b), borderRadius: BorderRadius.circular(10)),
      child: cardChild,
      height: double.infinity,
    );
  }
}
