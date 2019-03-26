import 'package:flutter/material.dart';
import 'holder_details.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import '../constants.dart';
class ListScreen extends StatefulWidget{
  _ListScreenState createState()=> new _ListScreenState();
}


class _ListScreenState extends State<ListScreen>{
  // ScrollController _scrollController = new ScrollController();
  
//  final String urlink= "http://192.168.43.254/safe-bangle/api/holders/read.php?page=1&&row_per_page=30";
  // final String urlink= urls+"holders/read.php?page=1&&row_per_page=30";
  
  // String id;
  List list;
  var oneitem;
  Future<String> getData() async{
    var response = await http.get(
      Uri.encodeFull(urls+"holders/read.php?page=1&&rows=30"),
      headers: {
        //keys:kjfogkorfe, 
        "Accept":"application/json" 
      }
      );
      setState(() {
              var resBody = json.decode(response.body);
              list = resBody;
            });
      // print(list);
    return "Success!";
    
  }
  fetchSix(){

    for(int i=0;i<=6;i++){
      getData();
    }
  }
  @override
  Widget build(BuildContext context){
    if(list==null){
      return new Container(        
        child: new Center(

          child: new Text("Please check internet connectivity!"),
        ),
      );
    }else{
      return new ListView.builder(
        // controller: _scrollController,
        
        itemCount: list==null?0: list.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            
            leading: new Icon(Icons.person,),
            dense: false,
            contentPadding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
            title: new Text("Name: "+list[index]["firstname"]+" "+list[index]['secondname']),  
            subtitle: new Text("Contacts: "+list[index]["phone"]+" and "+list[index]["altphone"]),
            onTap: (){
              // print(list[index]);
              Navigator.push(
                context, 
              MaterialPageRoute(builder: (context)=>HolderDetailsScreen(holder: list[index]["id"],),
              ));
              
            },

          );
        },
      
    );
    }
    }
    @override
    void initState(){
      super.initState();
      this.getData();
    }
    
}