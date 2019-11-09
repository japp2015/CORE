import 'package:flutter/material.dart';

class Rankings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rankings();
  }
}

class _Rankings extends State<Rankings> {
  List allItems = [
    {
      'name': 'Talk 1',
      'speaker': 'Jose Dias',
      'rank': '97%',
      'selected': false
    },
    {
      'name': 'Talk 2',
      'speaker': 'Joao Pereira',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 3',
      'speaker': 'Maria Ribeiro',
      'rank': '93%',
      'selected': false
    },
    {
      'name': 'Talk 4',
      'speaker': 'Patricia Rocha',
      'rank': '86%',
      'selected': false
    },
    {
      'name': 'Talk 5',
      'speaker': 'Ines Vilarinho',
      'rank': '85%',
      'selected': false
    },
    {
      'name': 'Talk 6',
      'speaker': 'Joao Afonso',
      'rank': '81%',
      'selected': false
    },
    {
      'name': 'Talk 7',
      'speaker': 'Jose Dias',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 8',
      'speaker': 'Ines Vilarinho',
      'rank': '75%',
      'selected': false
    },
    {
      'name': 'Talk 9',
      'speaker': 'Quim Barreiros',
      'rank': '70%',
      'selected': false
    }
  ];

  Widget getCards(item) {
    var val = false;

    return Padding(
      padding: EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Container(
        child: Card(
            child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Checkbox(
                      value: item['selected'],
                      onChanged: (bool value) {
                        setState(() {
                          item['selected'] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(item['speaker']),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(item['rank']),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
      ),
    );
  }

  Widget getRanking() {
    return Container(
      child: ListView(
        children: allItems.map((element) {
          return getCards(element);
        }).toList(),
      ),
    );
  }

  Widget getItem(List<String> item) {
    return Column(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('CORE'),
            backgroundColor: new Color(0xFF002A72),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () {})),
        body: Center(child: getRanking()),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 100, right: 100, bottom: 20),
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                  color: new Color(0xFF002A72),
                  elevation: 5,
                ))));
  }
}
