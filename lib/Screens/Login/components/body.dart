import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Homepage/home_screen.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/services/database.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Models/UserModel.dart';
class Body extends StatelessWidget {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _email=value;
              },
            ),
            RoundedPasswordField(

              onChanged: (value) {
                _password=value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                print(" email $_email $_password  ");
               await DataBase().signIn(_email, _password).then((value) {
                  print("=========================");
                  print(value);
                  print("login success");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Homescreen();
                      },
                    ),
                  );
                });
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Homescreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
