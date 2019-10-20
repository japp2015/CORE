import 'package:core/screens/firstQuestion.dart';
import 'package:core/screens/formAnswers.dart';
import 'package:core/screens/thirdQuestion.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class SecondQuestion extends StatefulWidget {

  List<String> answers;
  bool answered;

  SecondQuestion({Key key, this.answers}) : super (key:key);

  @override
  State<StatefulWidget> createState() {
    debugPrint(answers.toString());
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
            child: getButtons(),
          )),
    );
  }

  Widget getButtons() {

    if(widget.answers.length==1) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return FirstQuestion();
              }));
            },
            child: Text(
              "Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                if (q2_checked == null || q2_checked.isEmpty) {
                  widget.answers.add("Not answered");
                }
                else {
                  widget.answers.add(q2_checked.toString());
                }
                return ThirdQuestion(answers: widget.answers);
              }));
            },
            child: Text("Next", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }
    else {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormAnswers();
              }));
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: new Color(0xFF002A72)),
            ),
            color: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if(q2_checked == null || q2_checked.isEmpty) {
                    widget.answers[1] = "Not answered";
                  }
                  else {
                    widget.answers[1] = q2_checked.toString();
                  }
                  return FormAnswers(answers: widget.answers);

              }));
            },
            child: Text("Resubmit", style: TextStyle(color: Colors.white)),
            color: new Color(0xFF002A72),
          )
        ],
      );
    }

  }

}
