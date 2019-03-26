import 'package:flutter/material.dart';
import 'package:safe_bangle/safe_bangle_home.dart';
//import 'package:sms/sms.dart';
void main(){
    
    runApp(new MyApp());
    // SmsReceiver receiver = new SmsReceiver();
    // receiver.onSmsReceived.listen((SmsMessage msg)=>print(msg.body));
    
    // print(msg.);
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Safe Bangle SMS",
      theme: new ThemeData(
        
        primaryColor: new Color(0xFFffffff),
        accentColor: new Color(0xFF001A25)
      ),
      home: new SafeBangleHome(),
      debugShowCheckedModeBanner: false,
    );
    // sms_reciever();
  }
  
  // @override
  // void initState(){
  //   super.initState();
  //   smsreciever();
  // }
}