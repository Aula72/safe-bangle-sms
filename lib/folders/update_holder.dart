import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';
class UpdateHolderScreen extends StatefulWidget{
  _UpdateHolderScreenState createState()=> new _UpdateHolderScreenState();
}


class _UpdateHolderScreenState extends State<UpdateHolderScreen>{
  TextEditingController _firstname = TextEditingController();
  TextEditingController _secondname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _altphone = TextEditingController();
  TextEditingController _nin = TextEditingController();
  TextEditingController _dob = TextEditingController();
  String _id;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Update Holder Details"),
        leading: new Icon(Icons.person_add),
        elevation: 4.0,
        backgroundColor: new Color(0xff00FFF2),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              
              controller: _firstname,
              decoration: InputDecoration(
                labelText: "Firstname",
                focusedBorder: InputBorder.none
              ),
              onSaved: (value)=>_firstname.text,
              // initialValue: "hfgjkf",
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _secondname,
              // initialValue: "gijif",
              onSaved: (value)=>_secondname.text,
              decoration: InputDecoration(
                labelText: "Secondname",                
              ),
              keyboardType: TextInputType.text,
              ),
            TextFormField(
              // initialValue: "+2327872378",
              controller: _phone,
              decoration: InputDecoration(
              labelText: "Phone Number",
              errorText: "Invalid Phone Number"),
              onSaved: (value)=>_phone.text,
              keyboardType: TextInputType.phone,
              ),
            TextFormField(
              // initialValue: "+2345784573",
              controller: _altphone,
              decoration: InputDecoration(
                labelText: "Alternative Phone Number",
              ),
              onSaved: (value)=>_altphone.text,
              keyboardType: TextInputType.phone,
              // validator: ,
            ),
            TextFormField(
              // initialValue: "iugoiroti",
              controller: _nin,
              decoration: InputDecoration(
                labelText: "Nation ID Number",
                hintText: "CF45676873HYUT"
              ),
              onSaved: (value)=>_nin.text,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              keyboardType: TextInputType.datetime, 
              decoration: InputDecoration(labelText: "Date of Birth"),
              controller: _dob,
              onSaved: (value)=>_dob.text,

              ),
            RaisedButton(
              child: new Text("Update Holder's Details"),
              onPressed: (){
                updatingFunction(new UpdateHolder(
                  _firstname.text,
                   _secondname.text,
                    _phone.text,
                     _altphone.text,
                      _nin.text,
                       _dob.text,
                        _id));
              },
              color: Colors.red,
              )

          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
const jsonCodec = const JsonCodec();
updatingFunction(updateDetails) async{
  var updateUrl = urls+"holders/update.php";
  var jsonData = jsonCodec.encode(updateDetails);
  var response = await http.patch(updateUrl, body: jsonData,headers:{"Accept":"application/json"});
  return response;

}
class UpdateHolder{
  String firstn, secondn, phones, nins, altphones, dobs, ids;
  UpdateHolder(this.firstn, this.secondn, this.phones, this.altphones, this.nins, this.dobs, this.ids);
  Map toJson(){
    return {
      "id":ids,
      "firstname":firstn,
      "secondname":secondn,
      "phone":phones,
      "altphone":altphones,
      "nin":nins,
      "dob":dobs
    };
  }
}