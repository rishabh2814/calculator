import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAimation;
@override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 600)
    );
    _iconAimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }
  var num1=0, num2=0, sum=0;
  final TextEditingController t1 = new TextEditingController(text:"0");
  final TextEditingController t2 = new TextEditingController(text:"0");
  void doAddition(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
     sum = num1 + num2; 
    });
  }
  void doSubtraction(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
     sum = num1 - num2; 
    });
  }
  void doMultiplacation(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
     sum = num1 * num2; 
    });
  }
  void doDivide(){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
     sum = num1 ~/ num2; 
    });
  }
  void doClear(){
    setState(() {
      t1.text ="0";
      t2.text ="0";
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),

      ),
      body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("image/image.jpg") ,
              fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20.0),
           child: new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              new FlutterLogo(
                size: _iconAimation.value* 100,
                ), 
                new Padding(
                  padding: const EdgeInsets.only(top: 01.0) ,
                ),
               new Text("Output :$sum",
               style: new TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.purpleAccent),
               ),
               new TextField(
                 keyboardType: TextInputType.number,
                 decoration: new InputDecoration(
                   hintText: "Enter Number 1"
                 ),
                 controller: t1,
               ),
                new TextField(
                 keyboardType: TextInputType.number,
                 decoration: new InputDecoration(
                   hintText: "Enter Number 2"
                 ),
                 controller: t2,
               ),
               new Padding(
                 padding: const EdgeInsets.only(top: 01.0),
               ),
               new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   new MaterialButton(
                     child: new Text("+"),
                     color: Colors.blueAccent,
                     onPressed: doAddition,
                     splashColor: Colors.redAccent,
                   ),
                    new MaterialButton(
                     child: new Text("-"),
                     color: Colors.blueAccent,
                     onPressed: doSubtraction,
                     splashColor: Colors.redAccent,
                   ),
                 ],
               ),
               new Padding(
                 padding: const EdgeInsets.only(top: 01.0),
               ),
                new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   new MaterialButton(
                     child: new Text("*"),
                     color: Colors.blueAccent,
                     onPressed: doMultiplacation,
                     splashColor: Colors.redAccent,
                   ),
                    new MaterialButton(
                     child: new Text("/"),
                     color: Colors.blueAccent,
                     onPressed: doDivide,
                     splashColor: Colors.redAccent,
                   ),
                 ],
               ),
               new Padding(
                 padding: const EdgeInsets.only(top: 01.0),
               ),
               new Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     new MaterialButton(
                     child: new Text("Clear"),
                     color: Colors.blueAccent,
                     onPressed: doClear,
                     splashColor: Colors.redAccent,
                     ),
                  ],
               ),
             ],
           ),
          ),
      );
  }
}