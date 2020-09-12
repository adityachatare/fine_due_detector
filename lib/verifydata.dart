//import 'dart:html';

//import 'dart:html';
import 'verify_fine.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'getdata.dart';
//import 'package:flutter_razorpay_sdk/flutter_razorpay_sdk.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter/services.dart';
//import 'package:mlkit/mlkit.dart';
import 'package:google_fonts/google_fonts.dart';
class Vars extends StatefulWidget {
  
  String value;
 
  Vars({Key key,@required this.value}):super(key:key);

  @override
  _VarsState createState() => _VarsState(value);
}

class _VarsState extends State<Vars> {
  String value;
  bool dataFlag = false;
  Razorpay _razorpay;
  final fb = FirebaseDatabase.instance;
  var retName;
  var retFine;
  var retVehType;
  var retVehName;
  var retName1;
  @override

  void initState() { 
    super.initState();
     _razorpay = Razorpay();
     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }
  @override
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }
  void opencheckout(int num1) async{
    var options ={
    'key':'rzp_test_qhZvEipUFCVPnW',
    'amount': num1*100,
    'name' : 'Aditya Chatare',
    'description' : 'Test Payment',
    'prefill':{'contact':'9011192181','email':'test@test.com'},
    'external':{
        'wallets':['paytm']
    }
    };
    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }
  void _handlePaymentSucess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCESS"+ response.paymentId);

  }
  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: 'ERROR: '+ response.code.toString()+" - " + response.message);
    
  }
  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "EXTERNAL WALLET"+ response.walletName);
    
  }
  _VarsState(this.value);
  @override
  Widget build(BuildContext context) {
     String tex = "MH.20.BL.0256";
     
var ts = value;
   // var tk = ts.replaceAll(".","");
    var tk = ts.replaceAll("\n", "") ;
    tk = ts.replaceAll(".", "");
    final ref = fb.reference().child(tk);
     ref.child("Name").once().then((DataSnapshot data){
            setState(() {
              retName = data.value;
            });
          });
           ref.child("Fine").once().then((DataSnapshot data){
            setState(() {
              retFine = data.value;
            });
          });
           ref.child("Vehicle Type").once().then((DataSnapshot data){
            setState(() {
              retVehType = data.value;
            });
          });
           ref.child("Vehicle Name").once().then((DataSnapshot data){
            setState(() {
              retVehName = data.value;
            });
          });



    return Scaffold(
     appBar: AppBar(
      title: Text("Fine Details",style: TextStyle(color:Colors.white)),
        
      ),
      
     /* body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Fine ${retName.toString()}'),
        Text(retName2.toString())
      ],
      ),*/
      body:Column( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
      children:<Widget>[
      Container(
        
        height:390,
        decoration: BoxDecoration(
        color: Colors.orange[500],
        borderRadius:BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
        boxShadow:[ BoxShadow(
          color: Colors.grey,
          offset: Offset(3,7),
          blurRadius: 25
        )
        ]
      ),
        child:Column(children: [
            ListTile(
              title: Text('Name : ',style: TextStyle(color: Colors.purple[500],fontWeight: FontWeight.bold),),
              subtitle: Text("${retName.toString()}",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
              leading: Icon(
               Icons.people,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Vehicle Type :',style: TextStyle(color: Colors.purple[500],fontWeight: FontWeight.bold),),
               subtitle: Text("${retVehType.toString()}",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
               leading: Icon(
                Icons.adjust,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Vehicle Name : ',style: TextStyle(color: Colors.purple[500],fontWeight: FontWeight.bold),),
              subtitle: Text("${retVehName.toString()}",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
               leading: Icon(
                Icons.directions_car,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text("Vehicle No :",style:TextStyle(color: Colors.purple[500],fontWeight:FontWeight.bold),),
              subtitle: Text(tk,style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:25),),
              leading: Icon(
                Icons.confirmation_number,
                color:Colors.blue[500]
              ),
            ),
            ListTile(
              title: Text('Fine : ',style: TextStyle(color: Colors.purple[500],fontWeight: FontWeight.bold),),
              subtitle: Text("Rs. ${retFine.toString()}/-",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 25),),
               leading: Icon(
                Icons.attach_money,
                color: Colors.blue[500],
              ),
            ),
            
          ],)
        
        
      ),
      
      
     Container(
       height:300,
       
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30),
        
        ),
        boxShadow:[ BoxShadow(
          color: Colors.grey,
          offset: Offset(3,7),
          blurRadius: 25
        )
        ]
      ),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       //crossAxisAlignment: CrossAxisAlignment.center,
      
              children: [
              
                
              MaterialButton(
                 minWidth: 100.0,
                 height: 50.0,
                  onPressed: (){
                    opencheckout(retFine);
                  },
                  
                  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textColor: Colors.white,
          color: Colors.green,
                  child: Text("Pay",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
              MaterialButton(
                  minWidth: 100.0,
                  height: 50.0,
                
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MLHome()));
                  },
                   shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            
          ),
          textColor: Colors.white,
          color: Colors.red,
                  child: Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
               
                 
              ],
      ),
     )
      
      
      
        ]
      
       
      
      )
    );
  }
}