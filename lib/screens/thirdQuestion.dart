import 'package:core/screens/formAnswers.dart';
import 'package:core/screens/secondQuestion.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ThirdQuestion extends StatefulWidget {

  final List<String> q1_ans;
  final List<String> q2_ans;

  String val1, val2;

  ThirdQuestion({Key key, this.q1_ans, this.q2_ans}) : super (key:key);

  @override
  State<StatefulWidget> createState() {
    if(q1_ans == null || q1_ans.isEmpty) {
      val1 = "NÃO PREENCHEU NADA NA 1";
    }
    else {
      val1 = "Resposta na 1: " + q1_ans[0];
    }

    if(q2_ans == null || q2_ans.isEmpty) {
      val2 = "NÃO PREENCHEU NADA NA 2";
    }
    else {
      val2 = "Resposta na 2: " + q2_ans[0];
    }

    return Question();
  }
}

class Question extends State<ThirdQuestion> {
  @override
  String q3_txt;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text('CORE'), backgroundColor: new Color(0xFF002A72)),
      body: Container(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 30),
            child: Text(
              "Write some text",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: TextField(
                onSubmitted: (String userInput) { //onSubmitted o texto muda quando clicamos ok
                  setState(() {
                    q3_txt = userInput;
                    debugPrint(q3_txt);
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Some text',
                    hintText: 'e.g. blablabla',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)))),
          ),
        ]),
      )),
      bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SecondQuestion();
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
                      return FormAnswers(q1_ans: widget.q1_ans, q2_ans: widget.q2_ans, q3_ans: q3_txt);
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
