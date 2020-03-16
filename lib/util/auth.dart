import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  // Create storage
  static final storage = new FlutterSecureStorage();

  // ignore: non_constant_identifier_names
  static final String HOST = "http://192.168.43.204:3000/";

  static final SIGNUP_URL = HOST + "user/signup";
  static final LOGIN_URL = HOST + "user/login";

// Write value

  static Future<bool> signUp(User user) async {
    final response = await http.post(SIGNUP_URL,
        headers: {"Content-Type": "application/json"}, body: json.encode(user));

    if(response.statusCode == 200){
      user.storeUser();
      return true;
    }
    return false;
  }

  static Future<bool> login(User user) async {
    final response = await http.post(LOGIN_URL,
        headers: {"Content-Type": "application/json"}, body: json.encode(user));

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body).token;
      await storage.write(key: 'jwt', value: token);

      return true;
    }
    return false;
  }
}



class User {
  String callsign;
  String name;
  String surname;
  String email;
  String password;

  User(this.callsign, this.name, this.surname, this.email, this.password);

  Map<String, dynamic> toJson() => {
        'callsign': callsign,
        'name': name,
        'surname': surname,
        'email': email,
        'password': password
      };

  static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String callsign = prefs.getString("callsign");
    String name = prefs.getString("name");
    String surname = prefs.getString("surname");
    String email = prefs.getString("email");

    if(name == null) {
      return new User(" ", " ", " ", " ", null);
    }

    return new User(callsign, name, surname, email, null);
  }

  void storeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("callsign", this.callsign);
    prefs.setString("name", this.name);
    prefs.setString("surname", this.surname);
    prefs.setString("email", this.email);

  }
}
