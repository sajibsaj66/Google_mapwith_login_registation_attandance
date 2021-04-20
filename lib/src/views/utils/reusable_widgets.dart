import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'contants.dart';

// success toast
showSuccessToast(String message) {
  BotToast.showText(
      text: message,
      textStyle: TextStyle(color: kSoftWhiteColor, fontSize: 14),
      contentColor: Colors.green);
}

// error toast
showErrorToast(String message) {
  BotToast.showText(
      text: message,
      textStyle: TextStyle(color: kSoftWhiteColor, fontSize: 14),
      contentColor: Colors.red);
}

// rounded raised button
class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton(
      {@required this.text,
        @required this.textColor,
        @required this.imageLink,
        @required this.onTap,
        @required this.backgroundColor});

  final Function onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: RaisedButton(
          elevation: 4,
          color: backgroundColor,
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: imageLink == null
                ? Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w400),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(imageLink),
                ),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// text field with top label text
class TextFieldWithTopLabel extends StatelessWidget {
  TextFieldWithTopLabel(
      {@required this.labelText,
        @required this.hintText,
        @required this.textInputType,
        @required this.controller});

  final String labelText;
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$labelText',
          style: TextStyle(fontSize: 11, color: kSoftGreyColor),
        ),
        TextField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: '$hintText',
          ),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        )
      ],
    );
  }
}

// password field with top label
class PasswordFieldWithTopLabel extends StatelessWidget {
  PasswordFieldWithTopLabel(
      {@required this.labelText,
        @required this.hintText,
        @required this.showObscureButton,
        @required this.textEditingController,
        @required this.obscureText});

  final String labelText;
  final bool obscureText;
  final Function showObscureButton;
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$labelText',
          style: TextStyle(fontSize: 11, color: kSoftGreyColor),
        ),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: '$hintText',
            suffixIcon: IconButton(
                icon: obscureText
                    ? Icon(FontAwesomeIcons.eyeSlash)
                    : Icon(FontAwesomeIcons.eye),
                onPressed: showObscureButton),
          ),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        )
      ],
    );
  }
}