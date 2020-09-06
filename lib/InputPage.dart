import 'package:bmi_ui/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "calculation.dart";

const Color inActiveColor = Colors.grey;
const Color activeColor = Colors.white;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var maleColor = inActiveColor;
  var femaleColor = inActiveColor;
  var height = 180;
  var weight = 60;
  var age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleColor = inActiveColor;
                        });
                        if (maleColor == inActiveColor) {
                          setState(() {
                            maleColor = activeColor;
                          });
                        } else {
                          setState(() {
                            maleColor = inActiveColor;
                          });
                        }
                      },
                      child: Card(
                          cardChild: IconCardContent(
                              cardIcon: Icon(
                                FontAwesomeIcons.mars,
                                color: maleColor,
                                size: 90,
                              ),
                              cardText: "MALE",
                              cardColor: maleColor)),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          maleColor = inActiveColor;
                        });
                        if (femaleColor == inActiveColor) {
                          setState(() {
                            femaleColor = activeColor;
                          });
                        } else {
                          setState(() {
                            femaleColor = inActiveColor;
                          });
                        }
                      },
                      child: Card(
                          cardChild: IconCardContent(
                        cardIcon: Icon(
                          FontAwesomeIcons.venus,
                          color: femaleColor,
                          size: 90,
                        ),
                        cardText: "FEMALE",
                        cardColor: femaleColor,
                      )),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Card(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                          letterSpacing: 10, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 45),
                        ),
                        Text("cm")
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      activeColor: Color(0xFFff0367),
                      inactiveColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Card(
                            cardChild: CardType2Content(
                      cardtext: "WEIGHT",
                      weight: weight,
                      incrementHandler: () {
                        setState(() {
                          weight++;
                        });
                      },
                      decrementHandler: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Card(
                      cardChild: CardType2Content(
                        cardtext: "AGE",
                        age: age,
                        incrementHandler: () {
                          setState(() {
                            age++;
                          });
                        },
                        decrementHandler: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                child: FlatButton(
                  color: Color(0xFFff0367),
                  onPressed: () {
                    CalculateBMI calc =
                        CalculateBMI(height: height, weight: weight);

                    var bmi = calc.calculate();
                    var resultText = calc.getResult();
                    var interpretationText = calc.getInterpretration();
                    print(bmi);
                    print(resultText);
                    print(interpretationText);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmi: bmi,
                                  resultText: resultText,
                                  interpretationText: interpretationText,
                                )));
                  },
                  child: Text("Calculate"),
                ),
              )
            ],
          ),
        ));
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

class IconCardContent extends StatelessWidget {
  IconCardContent({this.cardIcon, this.cardText, this.cardColor});
  final Icon cardIcon;
  final String cardText;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cardIcon,
        SizedBox(
          height: 10,
        ),
        Text(
          cardText,
          style: TextStyle(
              color: cardColor, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class CardType2Content extends StatelessWidget {
  CardType2Content(
      {this.cardtext,
      this.incrementHandler,
      this.decrementHandler,
      this.age,
      this.weight});

  final int age;
  final int weight;
  final String cardtext;
  final Function incrementHandler;
  final Function decrementHandler;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          cardtext,
          style: TextStyle(letterSpacing: 10, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          cardtext == "WEIGHT" ? weight.toString() : age.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 43),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: decrementHandler,
              child: Icon(
                FontAwesomeIcons.minusCircle,
                size: 50,
              ),
            ),
            GestureDetector(
              onTap: incrementHandler,
              child: Icon(
                FontAwesomeIcons.plusCircle,
                size: 50,
              ),
            )
          ],
        )
      ],
    );
  }
}
