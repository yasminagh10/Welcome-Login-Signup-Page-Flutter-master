import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/UserModel.dart';
import 'package:flutter_auth/Screens/Homepage/components/body.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
class Homescreen extends StatelessWidget {
  final UserModel userModel;
  const Homescreen({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed:
          (){
            FirebaseAuth.instance.signOut().then((value){
              print("User Signed out");
              Navigator.push(context,  MaterialPageRoute(
                  builder: (BuildContext context) =>LoginScreen()));
            });

          })
        ],
      ),
      body: Body(),
    );
  }
}