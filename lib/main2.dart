//import 'package:fine_due/HomePage.dart';
//import 'package:mlkit/mlkit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:fine_due/Mapping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

//import 'loader.dart';
//import 'package:fine_due/main.dart';
//import 'package:fine_due/LoginRegisterPage.dart';
class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      new FirebaseAnalyticsObserver(analytics: analytics);
  const MyApp({Key key}) : super(key:key); 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "PUNE TRAFFIC COP",
      theme: new ThemeData(
      primarySwatch: Colors.orange,
      
      ),
      home: MappingPage(auth: Auth(),),
      debugShowCheckedModeBanner: false,
    );
  }
} 
