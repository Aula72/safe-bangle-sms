import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants.dart';
// import 'package:flutter/services.dart';
class AddHolderScreen extends StatefulWidget{
  _AddHolderScreenState createState()=> new _AddHolderScreenState();
}


class _AddHolderScreenState extends State<AddHolderScreen>{
  final formkey = GlobalKey<FormState>();
  // final ourController = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _secondname = TextEditingController();
  TextEditingController _phone= TextEditingController();
  TextEditingController _altphone= TextEditingController();
  TextEditingController _nin =TextEditingController();
  TextEditingController _dob=TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Form(
            key: formkey,
            autovalidate: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(  
                  controller: _firstname,               
                  decoration:const InputDecoration(
                    labelText: "Firstname",
                    hintText: "Ex. Janet"
                  ),
                  // validator: (input)=>!input.contains('a-z')?'Not valid':null,
                  onSaved: (value)=>_firstname.text,
                  maxLengthEnforced: false,
                  // onFieldSubmitted: Text(" "),
                  maxLength: 15,
                  // autovalidate: true,
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  
                  controller: _secondname,
                  decoration: const InputDecoration(
                    labelText: "Secondname", 
                    hintText: "Ex. Apio"
                  ) ,
                  onSaved: (value)=> _secondname.text,
                  maxLength: 15,
                  maxLengthEnforced: false,
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: _phone,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    hintText: "Ex. 0788227244"
                  ) ,
                  onSaved: (value)=> _phone.text,
                  maxLength: 10,
                  maxLengthEnforced: false,
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: _altphone,
                  decoration:const InputDecoration(
                    labelText: "Alternative Phone",
                    hintText: "Ex. 0785227244"
                  ) ,
                  onSaved: (value)=> _altphone.text,
                  maxLengthEnforced: false,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: _nin,
                  decoration:const InputDecoration(
                    labelText: "NIN",
                    hintText: "Ex. CF90043100RATC"
                  ) ,
                  onSaved: (value)=> _nin.text,
                  maxLength: 14,
                  maxLengthEnforced: false,
                  validator: (value){
                    if(value.isEmpty){
                      return "Field is required";
                    }
                  },
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: _dob,
                  decoration:const InputDecoration(
                    labelText: "Date of Birth",
                    hintText: "Format. MM/DD/YYYY"
                  ) ,
                  onSaved: (value)=> _dob.text,
                  keyboardType: TextInputType.datetime,
                  // keyboardType: TextInputType.,
                ),
                
                     RaisedButton(
                        onPressed: (){
                          // print(_nin.text);
                          _submit(new NewHolder(_firstname.text, _secondname.text, _phone.text, _altphone.text, _nin.text, _dob.text));
                          },
                        child: Text('Add New Holder'),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    
                  ],
                
              
           ),
          ),
        ),
      ),
    );
  }

  
}
const jsonCodec = const JsonCodec();
Future _submit(NewHolder newHolder) async{
  var json = jsonCodec.encode(newHolder);
  var urlpost = urls+"holders/create.php";
  var response = await http.post(urlpost, body: json, headers: {"Accept":"application/json"});
  print(json);
  return response;
  }
class NewHolder{
  String firstname, secondname, phone, altphone, nin, dob;
  NewHolder(this.firstname, this.secondname, this.phone, this.altphone, this.nin, this.dob);
  Map toJson(){
    return {
      "firstname":firstname, 
      "secondname":secondname, 
      "phone":phone, 
      "altphone":altphone, 
      "nin":nin, 
      "dob":dob
    };
  }
}