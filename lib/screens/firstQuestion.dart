import 'package:core/screens/secondQuestion.dart';
import 'package:core/screens/formAnswers.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class FirstQuestion extends StatefulWidget {

  List<String> answers;

  FirstQuestion({Key key, this.answers}) : super (key:key);

  @override
  State<StatefulWidget> createState() {

    return Question();
  }
}

class Question extends State<FirstQuestion> {
  @override
  List<String> q1_checked;


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
                  "Choose the three that interest you the most",
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
                      "Web Development",
                      "App Development",
                      "Security",
                      "Automation",
                      "Data Science",
                    ],
                  onSelected: (List<String> checked) {
                    q1_checked = checked;
                    print(q1_checked.toString());
                  },),
              ),
            ])),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: getButtons(),
          )),);
  }

  Widget getButtons() {

    if(widget.answers == null) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StartForm();
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
                if(widget.answers != null) {
                  if(q1_checked == null || q1_checked.isEmpty) {
                    widget.answers[0] = "Not answered";
                  }
                  else {
                    widget.answers[0] = q1_checked.toString();
                  }
                  return SecondQuestion(answers: widget.answers);
                }
                else {
                  List<String> ans;
                  if(q1_checked == null || q1_checked.isEmpty) {
                    ans = ["Not answered"];
                  }
                  else {
                    ans = [q1_checked.toString()];
                  }

                  return SecondQuestion(answers: ans);
                }

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
                if(widget.answers != null) {
                  if(q1_checked == null || q1_checked.isEmpty) {
                    widget.answers[0] = "Not answered";
                  }
                  else {
                    widget.answers[0] = q1_checked.toString();
                  }
                  return FormAnswers(answers: widget.answers);
                }
                else {
                  List<String> ans;
                  if(q1_checked == null || q1_checked.isEmpty) {
                    ans = ["Not answered"];
                  }
                  else {
                    ans = [q1_checked.toString()];
                  }

                  return FormAnswers(answers: ans);
                }

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
