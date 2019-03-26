import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AddReferenceScreen extends StatefulWidget{
  _AddReferenceScreenState createState()=> new _AddReferenceScreenState();
}


class _AddReferenceScreenState extends State<AddReferenceScreen>{
  final formkey = GlobalKey<FormState>();
  TextEditingController _firstname=TextEditingController();
  TextEditingController _secondname = TextEditingController();
  TextEditingController _nin = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _altphone = TextEditingController();
  TextEditingController _relationship = TextEditingController();
  // TextEditingController _holderid = TextEditingController();
  String _holderid;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Add Reference person"),
        leading: new Icon(Icons.person_add),
        backgroundColor: new Color(0xff00FFF2),
        centerTitle: true,
      ),
      body: Container(
         child:Form(
          
          key: formkey,
          child: Column(
            children: <Widget>[
              TextFormField(

                controller: _firstname,                
                decoration: InputDecoration(
                  labelText: "Firstname"
                ),
                onSaved: (value)=>_firstname.text,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _secondname,
                decoration: InputDecoration(
                  labelText: "Secondname"
                ),
                onSaved: (value)=>_secondname.text,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  labelText: "Phone"
                ),
                onSaved: (value)=>_phone.value,
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _altphone,
                decoration: InputDecoration(
                  labelText: "Alternative Phone"
                ),
                onSaved: (value)=>_altphone.value,
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _nin,
                decoration: InputDecoration(
                  labelText: "NIN"
                ),
                onSaved: (value)=>_nin.value,
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _relationship,
                decoration: InputDecoration(
                  labelText: "Relationship"
                ),
                onSaved: (value)=>_relationship.value,
                keyboardType: TextInputType.text,
              ),
              RaisedButton(
                child: new Text("Add Reference person"),
                onPressed: (){
                  print(_firstname);
                  _addreference(new ReferencePerson(
                    _firstname.text, 
                    _secondname.text, 
                    _phone.text, 
                    _altphone.text, 
                    _relationship.text, 
                    _nin.text, 
                    _holderid
                    ));
                },
                color: Colors.green,
                // padding: ,
                )
            ],
          ),
        )
      ),
    );
  }
}
const jsonCodec = const JsonCodec();
Future _addreference(ReferencePerson referencePerson) async{
  var urlper = "http://192.168.43.254/safe-bangle/api/relateds/create.php";
  var json = jsonCodec.encode(referencePerson);
  var response = await http.post(urlper, body: json, headers: {"Accept":"application/json"});
  return response;
}
class ReferencePerson{
  String firstname, secondname, nin, phone, altphone, relationship, holderid;
  ReferencePerson(this.firstname, this.secondname, this.phone, this.altphone, this.relationship, this.nin, this.holderid);
  Map toJson(){
    return {
      "firstname":firstname,
      "secondname":secondname,
      "phone":phone,
      "altphone":altphone,
      "nin":nin,
      "relationship":relationship,
      "holder_id":holderid
    };
  }
}