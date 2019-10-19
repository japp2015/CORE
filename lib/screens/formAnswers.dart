import 'package:core/screens/secondQuestion.dart';
import 'package:core/screens/startForm.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class FormAnswers extends StatefulWidget {

  final List<String> q1_ans;
  final List<String> q2_ans;
  final String q3_ans;

  String val1, val2, val3;

  FormAnswers({Key key, this.q1_ans, this.q2_ans, this.q3_ans})
      : super (key: key);

  @override
  State<StatefulWidget> createState() {
    if (q1_ans == null || q1_ans.isEmpty) {
      val1 = "Missing";
    }
    else {
      val1 = "";
      for (int i = 0; i < q1_ans.length; i++) {
        val1 = val1  +  q1_ans[i] + ", ";
      }
    }

    if (q2_ans == null || q2_ans.isEmpty) {
      val2 = "Missing";
    }
    else {
      val2 = "";
      for (int i = 0; i < q2_ans.length; i++) {
        val2 = val2 + q2_ans[i] + ", ";
      }
    }

    if (q3_ans == null || q3_ans.isEmpty) {
      val3 = "Missing";
    }
    else {
      val3 = q3_ans;
    }

    return Answers();
  }
}

class Answers extends State<FormAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        AppBar(title: Text('CORE'), backgroundColor: new Color(0xFF002A72)),
        body: Container(
          child:
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                  ListTile(
                    leading: Text(
                      "Answer 1"
                    ),
                    title: Text(
                      widget.val1,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                        "Answer 2"
                    ),
                    title: Text(
                      widget.val2,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                        "Answer 3"
                    ),
                    title: Text(
                      widget.val3,
                    ),
                  ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                    ListTile(
                      leading: Text(
                          "Answer 3"
                      ),
                      title: Text(
                        widget.val3,
                      ),
                    ),
                ],
                ),
              )


          /*Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 40, right: 40, top: 30, bottom: 30),
                  child: Text(
                    widget.val1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 30),
                child: Text(
                  widget.val2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 30),
                child: Text(
                  widget.val3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),*/
        ),
        bottomNavigationBar: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return StartForm();
                      }));
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: new Color(0xFF002A72)),
                    ),
                    color: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {

                    },
                    child: Text("Submit", style: TextStyle(color: Colors.white)),
                    color: new Color(0xFF002A72),
                  )
                ]
                ,
              )
              ,
            )));
  }


}