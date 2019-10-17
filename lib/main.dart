import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

void main() {
  runApp(MaterialApp(
    title: 'CORE',
    home: Form(),
  ));
}

class Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Question();
  }
}

class Question extends State<Form> {
  @override
  bool s1 = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('CORE'), backgroundColor: new Color(0xFF002A72)),
        body: Container(
            decoration: new BoxDecoration(color: Colors.white),
            child: Column(children: <Widget>[
                    SingleChildScrollView(
                        child: CheckboxGroup(
                            labels: <String>[
                              "Sunday",
                              "Monday",
                              "Tuesday",
                              "Wednesday",
                              "Thursday",
                              "Friday",
                              "Saturday",

                            ],
                            onSelected: (List<String> checked) =>
                                print(checked.toString()))),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: new Color(0xFF002A72)),
                      ),
                      color: Colors.white,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
                      color: new Color(0xFF002A72),
                    )
                  ],
                ),
              )
            ])));
  }
}
