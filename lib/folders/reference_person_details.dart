import 'package:flutter/material.dart';

class ReferencePersonDetailsScreen extends StatefulWidget{
  _ReferencePersonDetailsScreenState createState()=> new _ReferencePersonDetailsScreenState();
}


class _ReferencePersonDetailsScreenState extends State<ReferencePersonDetailsScreen>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("Person's Details"),
        backgroundColor: Color(0xff00FFF2),
        centerTitle: true,
        leading: Icon(Icons.person),
      ),
      body: Builder(builder: (BuildContext context){
        builder: new Container(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Column(), Column()
              ],)
            ],
          ),
        );
      },),
      resizeToAvoidBottomPadding: false,
    );
  }
}