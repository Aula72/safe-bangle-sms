import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'update_holder.dart';
import 'add_reference.dart';
import '../constants.dart';
import 'reference_person_details.dart';
class HolderDetailsScreen extends StatefulWidget{
  final String holder;
  HolderDetailsScreen({Key key, @required this.holder }):super(key:key); 
  @override
  _HolderDetailsScreenState createState()=> new _HolderDetailsScreenState();
}

// String x = HolderDetailsScreen holder;
class _HolderDetailsScreenState extends State<HolderDetailsScreen>{
  var oneitem;
  List reps;
  // var _reps;

  // [
  //   {"name":"hello","second":"hdfhkdf" },
  //   {"name":"hdfjhfde","second":"hdfhkdf" }
  //   ];
  
  final formkey = GlobalKey<FormState>();
  Future<String> getItem(ids) async{
    var response = await http.get(urls+'holders/readone.php?id=$ids', headers: {"Accept":"application/json"});
    setState(() {
          var resData = json.decode(response.body);
          oneitem = resData;
          print(oneitem);
        });

    return "Success!";
  }
  Future<String> getRepresent(ids) async{
    var representatives = await http.get(urls+"relateds/readsome.php?holder_id=$ids", headers: {"Accept":"application/json"});
    setState(() {
      var repData = json.decode(representatives.body);
      reps = repData;
      print(reps);
    });
    return "yes";
  }

  List<Widget> listrefernces()  {
          print(reps);
          List list = reps; 
          // d = reps
          
          for(int i=0;i<=list.length;i++){
            list.add(new Card(
              
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("htireer"),
                  Text("hfdsjfhkds")
                ],
              ),
            ));
          }
          return list;
          }
  @override
  Widget build(BuildContext context){
    // String ide = widget.holder;
    
    return new Scaffold(
      // widget:widget.holder,
      // floatingActionButtonAnimator: ,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Holder's Details"),
        elevation: 10.0,
        backgroundColor: new Color(0xff00FFF2),   
        leading: new Icon(Icons.person),
      ),
     
              
      body: Container(
        child: Column(
          children:<Widget> [
            Text("Person's Bio", 
          style: TextStyle(fontSize: 25, color: Colors.red), 
          textAlign: TextAlign.center 
          ,),
            Table(
          defaultColumnWidth: FlexColumnWidth(2.0),
          // columnWidths: TableColumnWidth(),
         border: TableBorder.all(
           width: 1.0, color: Colors.white, style:BorderStyle.none
         ),
          children:<TableRow>[
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Text("Full Name", style: TextStyle(fontSize: 20),),
                ),
                TableCell(child: Text("${oneitem['firstname']}  ${oneitem['secondname']}", style: TextStyle(fontSize: 20),),)
              ]
            ),
            //row 2
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Text("Phone", style: TextStyle(fontSize: 20),),
                ),
                TableCell(child: Text(oneitem["phone"], style: TextStyle(fontSize: 20),),)
              ]
            ),
            // row three
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Text("Alternate Phone", style: TextStyle(fontSize: 20),),
                ),
                TableCell(child: Text(oneitem["altphone"], style: TextStyle(fontSize: 20),),)
              ]
            ),
            //row 4
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Text("NIN", style: TextStyle(fontSize: 20),),
                ),
                TableCell(child: Text(oneitem["nin"], style: TextStyle(fontSize: 20),),)
              ]
            ),
            //ROW 5
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Text("DOB", style: TextStyle(fontSize: 20),),
                ),
                TableCell(child: Text(oneitem["dob"], style: TextStyle(fontSize: 20),),)
              ]
            ),
          ],
        ),
        Text("Reference People", 
        style: TextStyle(fontSize: 25, color: Colors.red), 
        textAlign: TextAlign.center 
        ,),
        // ListView.builder(
        //   itemCount: reps==null?0:reps.length,
        //   itemBuilder: (BuildContext context, int index){
        //     return ListTile(
        //       leading: Icon(Icons.person),
        //       title: Text("Aula Simon"),
        //       subtitle: Text("+256788227244 and +256753711078"),
        //       onTap: (){
        //         Navigator.push(
        //           context, 
        //           MaterialPageRoute(builder: (context)=>ReferencePersonDetailsScreen())
        //         );
        //       },
        //     );
        //   },
        // ),
        Column(children: listrefernces()),
        RaisedButton(
            //  elevation: 18.0,
             padding: EdgeInsets.all(4.0),
                child: Text("Add Reference Person"),
                onPressed: (){
                   Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>AddReferenceScreen())
                  );
                  // print("hgjfghi iuriture");
                
                },
                textColor: Colors.white,
                color: Colors.blue,
              ),

          ]
          )
          ),
        //raise button
        
         
      backgroundColor: new Color(0xffffffff),
      bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                RaisedButton(
                child: Text("Update"),
                onPressed: (){
                  print(widget.holder);
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>UpdateHolderScreen())
                  );
                },
                color: Colors.green,
                textColor: Colors.white,
              ),
              ],),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                RaisedButton(
                child: Text("Delete"),
                onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
              ),

              
              ],), 
              
            ],
          ),
    );
    
  }
  
  // final String oneLink = urls+"holders/readone.php?id=";
  
  
  @override
    void initState(){

      super.initState();
      // this.reps;
      //  this.getItem(ids)
      String i = widget.holder;
      // this._reps =this.getItem(i);
      // this._repslist = this.getRepresent(i)
      this.listrefernces();
      // this.getRepresent(i);
  }
}

