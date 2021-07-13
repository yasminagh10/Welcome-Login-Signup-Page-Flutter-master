import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
class RoundedPasswordField extends StatefulWidget {

  final ValueChanged<String> onChanged;
  RoundedPasswordField({
  Key key,
  this.onChanged,
}) : super(key: key);
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  var isSecured = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isSecured,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: (){
              setState(() {
                isSecured = !isSecured;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
