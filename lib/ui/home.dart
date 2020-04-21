import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homestate();
  }
}

class homestate extends State<Home>{
final TextEditingController age = new TextEditingController();
final TextEditingController height = new TextEditingController();
final TextEditingController weight = new TextEditingController();
double result = 0.0;
String s = "";
void calculate()
{
  setState(() {
    result = calc(weight.text,height.text);
    if(result<18.5)
      s="Underweight";
    else if(result>=18.5 && result<25.0)
      s="Normal Weight";
    else if(result>=25.0 && result<30.0)
      s="Over Weight";
    else
      s="Obesity";
  });
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',
            height: 133.0,
            width: 200.0,),
            new Container(
             margin: EdgeInsets.all(3.0),
             alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      icon: new Icon(Icons.person)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  new TextField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "In Centimeter",
                        icon: new Icon(Icons.assessment)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(3.0)),
                  new TextField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight",
                        hintText: "In kg",
                        icon: new Icon(Icons.assignment)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new RaisedButton(onPressed: calculate,
                  color: Colors.purple,
                  child: new Text("Calculate",
                  style: new TextStyle(
                    color: Colors.white
                  ),),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(5.0)),
            new Text("BMI is :$result",
            style: new TextStyle(
              color: Colors.indigo,
              fontSize: 15.0,
              fontWeight: FontWeight.w400
            ),),
            new Text("$s",
              style: new TextStyle(
                  color: Colors.indigo,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400
              ),),
          ],
        ),
      ),
    );
  }

}

double calc(String w, String h) {
  double bmi,a=double.parse(h)/100.0;
  bmi=double.parse(w)/(a*a);
  print("$bmi");
  return bmi;
}