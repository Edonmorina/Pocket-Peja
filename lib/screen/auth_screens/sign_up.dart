import 'package:flutter/material.dart';
import 'package:pocket_peja/constants/theme_colors.dart';
import 'package:provider/provider.dart';
import 'package:pocket_peja/authentication/authentication_service.dart';
import 'package:pocket_peja/widgets/signIn_signUp_widgets/signin_up_text_field.dart';
import 'package:pocket_peja/constants/constants.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _registerEmail = TextEditingController();

  TextEditingController _registerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          decoration:
              const BoxDecoration(gradient: ThemeColors.kBackgroundColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 14),
            child: Stack(
              children: <Widget>[
                SafeArea(
                  child: Align(
                    alignment: const Alignment(-1, -0.95),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_rounded,
                          size: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: SignInUpTextFormField(
                      fieldController: _registerEmail, labelText: 'Email'),
                ),
                Align(
                  alignment: const Alignment(0, 0.2),
                  child: SignInUpTextFormField(
                      fieldController: _registerPassword,
                      obscureText: true,
                      labelText: 'Password'),
                ),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: TextButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signUp(
                          email: _registerEmail.text.trim(),
                          password: _registerPassword.text.trim());
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: size.width / 1.75,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(12.5, 12.5),
                        ),
                      ),
                      child: const Center(
                        child: Text('Sign Up', style: kSignInUpButtonStyle),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// context.read<AuthenticationService>().signUp(
//                               email: registerUsername.text.trim(),
//                               password: registerPassword.text.trim(),
//                             );
