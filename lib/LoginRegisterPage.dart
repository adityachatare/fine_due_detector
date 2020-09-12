//import 'dart:io';
//import 'dart:io';
//import 'loader.dart';
import 'package:fine_due/Authentication.dart';
//import 'theme_changer.dart';
import 'package:fine_due/DialogBox.dart';
//import 'package:fine_due/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
  });
    final AuthImplementation auth;
  final VoidCallback onSignedIn;
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();

}
enum FormType{
  login,
  register
}


class _LoginRegisterPageState extends State<LoginRegisterPage> {
  DialogBox dialogBox = new DialogBox();
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  
  void moveToRegister()
  {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }
  void moveToLogin()
  {
     formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }
  
  
bool validateAndSave()
{
  final form = formKey.currentState;
  if(form.validate())
  {
    form.save();
    return true;
  }
  else
  {
    return false;
  }
}
void validateAndSubmit() async
{
  if(validateAndSave())
  {
    try{
      if(_formType == FormType.login)
      {
        String userId = await widget.auth.signIn(_email, _password);
        print("Login userId ="+userId);

      }
      
     else{
        String userId = await widget.auth.signUp(_email, _password);
        dialogBox.information(context, "Congrats..!", "Account Created");
        print("Register userId ="+userId);

    }
  widget.onSignedIn();

 
    }
    
  
    catch(e)
    {
      dialogBox.information(context, "Error=", e.toString());
      print("Error = "+e.toString());
    }
    
  }
  
}
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    
return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
     title :  new Text("PUNE TRAFFIC COP",style: TextStyle(color: Colors.white),),
     
    backgroundColor: Colors.orange,
      ),
      body:  Container(
        
        decoration: BoxDecoration(
          
          image: DecorationImage(
            image: AssetImage('images/1.png',
            ),
            fit: BoxFit.cover
            
          ),
        ),
        margin: EdgeInsets.all(0.0),
        
child:SingleChildScrollView(
  

        child: new Form(
          
          key: formKey,
          child: new Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
           
children: createInputs()+createButtons(),
          ),
        ),
        ),
      ),
    );
    
  }
  List<Widget> createInputs()
  {
     
    return[
      
        SizedBox(height: 370.0,),
        
        SizedBox(height: 20.0,),
  
        
  
        new TextFormField(
          
          decoration: new InputDecoration(labelText: 'LoginID',
           
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
        ),
        filled: true,
        
        contentPadding: EdgeInsets.all(16),
       
          ),
          
          validator: (value)
          {
            return value.isEmpty? 'LoginID is required.' : null;
          },
          onSaved: (value){
            return _email = value;
          },
        ),
        SizedBox(height: 20.0,),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
          ),
          obscureText: true,
          
          validator: (value)
          {
            return value.isEmpty? 'Password is required.' : null;
          },
          onSaved: (value){
            return _password = value;
          },
        ),
          SizedBox(height: 120.0,),
       
    ];
    
  }
  /*Widget logo()
  {
    return new Hero(
    child: new CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 110.0,
      child: Image.asset('images/app_logo.jpg'),
    ), tag: 'Hero',
    );
  }*/
   List<Widget> createButtons()
  {
    if(_formType == FormType.login)
    { 
      return[
        ButtonTheme(
          minWidth: 200.0,
          height: 50.0,
        child:new RaisedButton(
          child: new Text("Login",style: new TextStyle(fontSize: 20.0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textColor: Colors.white,
          color: Color.fromRGBO(0, 120, 240, 70), 
          
          onPressed: validateAndSubmit,
        ), 
        /*new RaisedButton(
          child: new Text("Exit",style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.pink, 
          onPressed: ()=>exit(0),
        ), 
        new FlatButton(
          child: new Text("Not have account? Create Account",style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.red, 
          onPressed: moveToRegister,
        ), */
        )
    ];
  
    }
      else{
       return[
        new RaisedButton(
          child: new Text("Create Account",style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Colors.pink, 
          onPressed: validateAndSubmit,
        ), 
        new FlatButton(
          child: new Text("Already Have an Account..?",style: new TextStyle(fontSize: 20.0)),
          textColor: Colors.red, 
          onPressed: moveToLogin,
        ), 
    ];
    }
  }
}