import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/UserModel.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/Homepage/home_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/database.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropval = null;
  String _email;
  String _password;
  String _pos;
  String _name;

  void dropchange(String val) {
    setState(() {
      dropval = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: size.width * 0.8 ,
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefix: Icon(Icons.person, color: kPrimaryColor),
                      filled: true,
                      fillColor: kPrimaryLightColor,
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    iconSize: 35,
                    hint: Text('type'),
                    dropdownColor: kPrimaryLightColor,
                    onChanged: dropchange,

                    value: dropval,

                    items: <String>['Student', 'Doctor', 'Instructor']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList())),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                print("User Name : $_name email $_email $_password  pos $dropval ");
                DataBase().signUp(_email, _password).then((value) {
                  String uid = value.user.uid;
                  DataBase().createUserData(_name, "20", dropval, uid,_email).then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Homescreen(userModel: UserModel(_name,_email,uid,"Student"),);
                      },
                    ),
                  ) );
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
