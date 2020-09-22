import 'package:flutter/material.dart';
import 'package:latihan_pertama/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Halaman Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _FormLogin createState() => _FormLogin();
}

class _FormLogin extends State<Login> {
  String username = "ismail";
  String password = "12345";
  String alert = "siap login";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  void prosesLogin() {
    if (_formKey.currentState.validate()) {
      if (usernameInput.text == username && passwordInput.text == password) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      username: usernameInput.text,
                    )));
      } else {
        setState(() {
          alert = "username dan password salah";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Wedding Organizer Ismail"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8), //teuapal
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //arraywidget
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black87, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Selamat Datang, Silahkan Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(alert),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: usernameInput,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "isi username";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38)),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black38,
                        ),
                        hintText: "Masukan Nama",
                        hintStyle: TextStyle(color: Colors.black38),
                        labelText: "username",
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordInput,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "isi password";
                        }

                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 40,
                          color: Colors.black38,
                        ),
                        hintText: "Masukan Password",
                        hintStyle: TextStyle(color: Colors.black38),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.black87,
                      elevation: 5,
                      child: Container(
                        height: 50,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () => prosesLogin(),
                          child: Center(
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
