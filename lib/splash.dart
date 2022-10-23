import 'dart:async';
import 'package:aplikasi/login.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/splash_screen_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SplashScreenView(
          navigateRoute: login(),
          pageRouteTransition: PageRouteTransition.Normal,
          duration: 3000,
          imageSrc: "img/cityp.png",
          imageSize: 150,
          text: "This is Our City",
          textType: TextType.NormalText,
          textStyle: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 3),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => login())));
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       child: Scaffold(
  //           body: Center(
  //     child: Text("Splash"),
  //   )));
  // }
}
