import 'package:flutter/material.dart';
import 'folders/list_holders.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'folders/add_holder.dart';
import 'package:sms/sms.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SafeBangleHome extends StatefulWidget{
  @override
  _SafeBangleHomeState createState()=> new _SafeBangleHomeState();
}
  

class _SafeBangleHomeState extends State<SafeBangleHome> with SingleTickerProviderStateMixin{
  
  TabController _tabController;
  
  @override
  void initState(){
    super.initState();
      _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
    smsreciever();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("Safe Bangle SMS"),
        backgroundColor: new Color(0xFF00FFF2),
        elevation: 4.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: new Color(0xFF000000),
          tabs: <Widget>[
            new Tab(text: "List of Holders",),
            new Tab(text: "Add Holder",),
            // new Tab(text: "Add Reference"),
            // new Tab(text: "App",)
          ],
        ),
        
        ),
        body: new TabBarView(
          
          controller: _tabController,
          children: <Widget>[
            new ListScreen(),
            new AddHolderScreen(),
            // new AddReferenceScreen()
          ],
        )
    );
  }
  
}

// const jsonCodec = const JsonCodec();
     const platform = const MethodChannel('sendSms');
     Future<Null> sendSms() async{
    try{
      final String result = await platform.invokeMethod('send',<String,dynamic>{"phone":"+256778895568","msg":"Hello! I'm sent programatically."}); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch(e){
      print(e.toString());
    }
  }
   smsreciever() {
    //  print("hfdjfhsdj");
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) =>(){sendSms();});
      
    //     SmsSender sender = new SmsSender();
    //     String address = "+256775518197";
    //     String reciever = msg.body[0]+" "+msg.body[1];
    //     sender.sendSms(new SmsMessage(address, "Hello, $reciever am in troube, don't worry it is just a test!"));
    //   }catch(IndexError){

    //   }
      
    // } );
  }
  // @override
  // initState(){

  // }

  // _sendmessages(Messages messages) async{
  //   var urlpost = "http://192.168.43.254/safe-bangle/api/holders/create.php";
  //   var json = jsonCodec.encode(messages);
  //   var response = await http.post(urlpost, body: json, headers: {"Accept":"application/json"});
  //   return response;

  // } 
class Messages{
  String codes, latitude, longtude, holderid, currenttime;
  Messages(this.codes, this.longtude, this.latitude, this.holderid, this.currenttime);
  Map toJson(){
    return {"code":codes, "holder_id":holderid, "latitude":latitude, "longtude":longtude, "current_time":currenttime };
  }
}