import 'package:flutter/material.dart';
import 'package:kekradio_client/util/auth.dart';

class RegisterUser extends StatefulWidget {
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final callsignController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.

    User user = new User(callsignController.text, nameController.text,
        surnameController.text, emailController.text, passwordController.text);
    var status = await Auth.signUp(user);
    // If Web call Success than Hide the CircularProgressIndicator.
    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(status ? "Signed Up Successfully" : "RIP"),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('User Registration Form',
                  style: TextStyle(fontSize: 21))),
          Divider(),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: callsignController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Callsign Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Name Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: surnameController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Surname Here'),
              )),

          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Email Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                autocorrect: true,
                obscureText: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your Password Here'),
              )),
          RaisedButton(
            onPressed: userRegistration,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Register User Online'),
          ),
        ],
      ),
    )));
  }
}
