import 'package:flutter/material.dart';


class UpdateReferencePersonScreen extends StatefulWidget{
  _UpdateReferencePersonScreenState createState()=> new _UpdateReferencePersonScreenState();
}


class _UpdateReferencePersonScreenState extends State<UpdateReferencePersonScreen>{
  final formKey = GlobalKey<FormState>();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _secondname= TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _altphone = TextEditingController();
  TextEditingController _nin = TextEditingController();
  TextEditingController _relationship = TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("Update Details"),
        backgroundColor: Color(0xFF00FFF2),
      ),
      body: Container(
        child: Form(
          key: formKey,
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
                  // _addreference(new ReferencePerson(
                  //   _firstname.text, 
                  //   _secondname.text, 
                  //   _phone.text, 
                  //   _altphone.text, 
                  //   _relationship.text, 
                  //   _nin.text, 
                  //   _holderid
                  //   ));
                },
                color: Colors.green,
                textColor: Colors.white,
                // padding: ,
                )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}