import 'package:aplikasi/login.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var emailControl = TextEditingController();
  var passControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // checkLogin();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "username",
                    labelText: "username",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.people)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailControl,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passControl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // OutlinedButton.icon(
              //     onPressed: () {
              //       register();
              //     },
              //     icon: Icon(Icons.login),
              //     label: Text("Register"))
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Sudah Punya akun?',
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: Colors.black),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Text(
                    'Klik disini!',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.redAccent,
                        decorationStyle: TextDecorationStyle.solid),
                  ))
            ],
          ),
        ),
      )),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
