import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:interview/src/business_logics/services/api_services/repository.dart';
import 'package:interview/src/business_logics/utils/constants.dart';
import 'package:interview/src/views/ui/home.dart';
import 'package:interview/src/views/utils/contants.dart';
import 'package:interview/src/views/utils/reusable_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailETController, _passwordETController;
  bool obsecurePassword = true, inProgress = false;

  @override
  void initState() {
    super.initState();
    _emailETController = TextEditingController();
    _passwordETController = TextEditingController();
  }

  @override
  void dispose() {
    _emailETController.dispose();
    _passwordETController.dispose();
    super.dispose();
  }

  Future<void> userLogin(String email, String password) async {
    if (mounted) {
      setState(() {
        inProgress = true;
      });
    }
    final _response = await repository.userLogin(email, password);
    if (mounted) {
      setState(() {
        inProgress = false;
      });
    }
    if (_response.id == ResponseCode.SUCCESSFUL) {
      showSuccessToast("Login Successfully");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    } else {
      showErrorToast(_response.object);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        color: Colors.black87,
        progressIndicator: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kWhiteColor,
            ),
            padding: EdgeInsets.all(20),
            child: Lottie.asset(
              'assets/lottie_anims/main_loader.json',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            )),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'iBOS',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kBlueColor,
                            fontSize: 35),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        color: kBlackColor,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Sign In with your existing account',
                    style: TextStyle(
                        fontSize: 14,
                        color: kBlackColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  TextFieldWithTopLabel(
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailETController,
                    hintText: 'Email',
                  ),
                  SizedBox(height: 15),
                  PasswordFieldWithTopLabel(
                      labelText: 'Password',
                      hintText: 'Password',
                      showObscureButton: () {
                        obsecurePassword = !obsecurePassword;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      textEditingController: _passwordETController,
                      obscureText: obsecurePassword),
                  SizedBox(height: 30),
                  RoundedRaisedButton(
                      text: 'Login',
                      textColor: kWhiteColor,
                      imageLink: null,
                      onTap: () {
                        final email = _emailETController.text.trim();
                        final password = _passwordETController.text;
                        final validEmail = EmailValidator.validate(email);
                        if (validEmail) {
                          if (password.length > 6) {
                            userLogin(email, password);
                          } else {
                            showErrorToast(
                                'Enter a password more than 6 letters!');
                          }
                        } else {
                          showErrorToast('Enter a valid email!');
                        }
                      },
                      backgroundColor: kBlueColor),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
