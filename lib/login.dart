import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi/register.dart';
import 'package:aplikasi/home.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  var emailControl = TextEditingController();
  var passControl = TextEditingController();

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = await pref.getString("login");
    if (val != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home()));
    }
  }

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
                  "Login",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  controller: emailControl,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
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
                ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Belum Punya akun?',
                  style: TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.black),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Text(
                      'Daftar disini!',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.redAccent,
                      ),
                    ))

                // TextButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => register()));
                //     },
                //     child: Text("Daftar",))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  void login() async {
    if (passControl.text.isNotEmpty && emailControl.text.isNotEmpty) {
      if (emailControl.text == 'malikcitizen@gmail.com' &&
          passControl.text == '123') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Berhasil login")));
        pageRoute(emailControl.text);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email atau Password salah")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data harus diisi")));
    }
  }

  void pageRoute(String token) async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  }
}
