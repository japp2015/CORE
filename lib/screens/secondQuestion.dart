import 'package:core/screens/firstQuestion.dart';
import 'package:core/screens/thirdQuestion.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class SecondQuestion extends StatefulWidget {

  final List<String> q1_ans;
  String val;

  SecondQuestion({Key key, this.q1_ans}) : super (key:key);

  @override
  State<StatefulWidget> createState() {
    if(q1_ans == null || q1_ans.isEmpty) {
      val = "NÃO PREENCHEU NADA NA 1";
    }
    else {
      val = "RESPOSTA NA 1: " + q1_ans[0];
    }
    return Question();
  }
}

class Question extends State<SecondQuestion> {
  @override
  List<String> q2_checked;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text('CORE'), backgroundColor: new Color(0xFF002A72)),
      body: Container(
          child: Column(children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 30),
              child: Text(
                "Choose your area of education",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CheckboxGroup(
                labels: <String>[
                  "Engineering",
                  "Technical",
                  "Sales",
                  "Automation",
                  "Data Science",
                ],
                onSelected: (List<String> checked) {
                  q2_checked = checked;
                  print(q2_checked.toString());
                },
              ),
            ),
          ])),
      bottomNavigationBar: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FirstQuestion();
                }));
              },
              child: Text(
                "Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
              ),
              color: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThirdQuestion(q1_ans: widget.q1_ans, q2_ans: q2_checked);
                }));
              },
              child: Text("Next", style: TextStyle(color: Colors.white)),
              color: new Color(0xFF002A72),
            )
          ],
        ),
      )),
    );
  }
}
