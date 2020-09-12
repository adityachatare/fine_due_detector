//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'verify_fine.dart';
//import 'theme_changer.dart';
import 'dart:io';
class HomePage extends StatefulWidget {
    
  HomePage
  ({
    this.auth,
    this.onSignedOut,
 // this.currentUser,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  //final FirebaseUser currentUser;

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MLHome()));
}
    
  void _logoutUser() async
  {
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e){
      print(e.toString());
    }
  }
  bool switchControl = false;
var textHolder = 'Switch is OFF';
  void toggleSwitch(bool value)
{
   if(switchControl == false)
      {
        setState(() {
          switchControl = true;
          textHolder = 'Switch is ON';
        darkThemeEnabled = true;
        });
        
        
        // Put your code here which you want to execute on Switch ON event.
 //ThemeBuilder.of(context).changeTheme();
      }
      else
      {
        setState(() {
          switchControl = false;
           textHolder = 'Switch is OFF';
           darkThemeEnabled = false;
        });
       
        // Put your code here which you want to execute on Switch OFF event.
      }
}
bool darkThemeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkThemeEnabled ? ThemeData.dark(): ThemeData(primarySwatch: Colors.orange),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
  Widget home(){
return new Scaffold(
      
      appBar: new AppBar(
      
        title: new Text("Home",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      drawer: new Drawer(
        
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Aditya Chatare"),
              accountEmail: new Text("test@test.com"),
              currentAccountPicture: new CircleAvatar(),
            ),
            
         new ListTile(
           
              leading: new Icon(Icons.home),
              title: new Text("HOME",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
              
            ),
            ),
            new ListTile(
              leading: new Icon(Icons.book),
              title: new Text("REGISTER FINE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
            ),
            ),
            new ListTile(
              leading: new Icon(Icons.search),
              title: new Text("CHECK FINE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
            )
            ),
            new ListTile(
              leading: new Icon(Icons.verified_user),
              onTap: () 
              {
                navigateToSubPage(context);
              },
              title: new Text("VERIFY DETAILS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
            ),
            ),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              onTap: ()=>_logoutUser(),
              title: new Text("LOGOUT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
              
            ),
            ),
            new Divider(
              
            ),
            new ListTile(
              trailing:  Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: Colors.blue,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              
            ),
              title: new Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
            ),
            ),
            ],
        ),
      ),
      
     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [

Container(
  height: 100,
  decoration: BoxDecoration(
    
  ) ,
child:  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:[
    Text("Good Morning Cop...",style: TextStyle(color:Colors.purple,fontSize: 20,fontWeight: FontWeight.bold,),), 
     //Text("Location : Warje Chowk",style: TextStyle(color:Colors.purple,fontSize: 15,fontWeight: FontWeight.bold,),) 
      
  ],)
),
Container(
  
  height: 450,
  decoration: BoxDecoration(
    color: Colors.orange,
  //  borderRadius: BorderRadius.all(topLeft:Radius.circular(30),topRight:Radius.circular(30),),
   borderRadius: BorderRadius.all(Radius.circular(30))
  ),
 
 child: ListView(
   padding: const EdgeInsets.only(top:30),
    children:const <Widget>[
    
      Card(
        child:ListTile(
          leading: Icon(Icons.local_car_wash),
          title:Text("MH46X9189",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
          trailing: RaisedButton(
            onPressed:null,
            child: Text("Pay"),
            color: Colors.red,
          
          )
        )
      ),
      Card(
        child:ListTile(
          leading: Icon(Icons.directions_bike),
          title:Text("MH06BK7029",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
          trailing: RaisedButton(
            onPressed: null,
            child: Text("Pay"),
            color: Colors.green,
          )
        )
      ),
       Card(
        child:ListTile(
          leading: Icon(Icons.directions_bike),
          title:Text("MH06BB5022",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
          trailing: RaisedButton(
            onPressed: null,
            child: Text("Pay"),
            color: Colors.green,
          )
        )
      ),
       Card(
        child:ListTile(
          leading: Icon(Icons.directions_bus),
          title:Text("MH20BL0256",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
          trailing: RaisedButton(
            onPressed: null,
            child: Text("Pay"),
            color: Colors.green,
          )
        )
      ),
      
    ]
  ),
  
),
Container(
  
  width: 480,
  height: 100,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
  color: Colors.purple
  
  ),
  child:Row(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
   children: [
       RaisedButton(
        child: Text("Refresh",style: TextStyle(color: Colors.white),),
        onPressed: (){

        },
        color: Colors.green,
       shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
      ),
     RaisedButton(onPressed: (){
       exit(0);
     },
     child:Text("Exit",style: TextStyle(color:Colors.white),),
     color: Colors.red,
     shape: RoundedRectangleBorder(
       borderRadius:BorderRadius.circular(12)
     ),
     ),
   
     
   ],
   ),
),

       ],
       
     )
    );
          
  }
}
