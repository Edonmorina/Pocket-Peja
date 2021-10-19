import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_peja/constants/theme_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_peja/screen/auth_screens/sign_up.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:provider/provider.dart';
import 'package:pocket_peja/authentication/authentication_service.dart';
import 'package:pocket_peja/constants/constants.dart';
import 'package:pocket_peja/widgets/signIn_signUp_widgets/signin_up_text_field.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/signIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final String assetName = 'assets/river.svg';

  late AnimationController _fadeController;

  bool _visible = false;

  Alignment _alignLogo = const Alignment(0.0, -0.2);
  Alignment _alignFirstTextField = const Alignment(0.0, 0.25);
  Alignment _alignSecondTextField = const Alignment(0.0, 0.5);
  Alignment _alignSignUp = const Alignment(-1, 0.625); //0.325
  Alignment _alignForgotPassword = const Alignment(-1, 0.690); //0.390
  Alignment _alignSignInButton = const Alignment(0.0, 1);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _changePosition() {
    setState(() {
      _alignLogo = _alignLogo == const Alignment(0.0, -0.2)
          ? const Alignment(0.0, -0.5)
          : const Alignment(0.0, -0.2);
      _alignFirstTextField = _alignFirstTextField == const Alignment(0.0, 0.25)
          ? const Alignment(0.0, -0.0)
          : const Alignment(0.0, 0.25);
      _alignSecondTextField = _alignSecondTextField == const Alignment(0.0, 0.5)
          ? const Alignment(0.0, 0.20)
          : const Alignment(0.0, 0.5);
      _alignSignUp = _alignSignUp == const Alignment(-1, 0.625)
          ? const Alignment(-1, 0.325)
          : const Alignment(-1, 0.625);
      _alignForgotPassword = _alignForgotPassword == const Alignment(-1, 0.690)
          ? const Alignment(-1, 0.390)
          : const Alignment(-1, 0.690);
      _alignSignInButton = _alignSignInButton == const Alignment(0, 1)
          ? const Alignment(0, 0.650)
          : const Alignment(0, 1);

      _visible = !_visible;
    });
  }

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _changePosition();
    });
  }

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
          decoration:
              const BoxDecoration(gradient: ThemeColors.kBackgroundColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 14),
            child: Stack(
              children: <Widget>[
                // left = x value, top = y value;
                // to set last position (50,10) top:50, left:10, end _animation Offset.zero

                AnimatedAlign(
                  curve: Curves.decelerate,
                  alignment: _alignLogo,
                  duration: const Duration(milliseconds: 900),
                  child: SimpleShadow(
                    child: SvgPicture.asset(
                      assetName,
                      height: size.height * 0.175,
                    ),
                  ),
                ),

                AnimatedAlign(
                    curve: Curves.decelerate,
                    alignment: _alignFirstTextField,
                    duration: const Duration(milliseconds: 1200),
                    child: AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1200),
                      child: SignInUpTextFormField(
                          fieldController: _emailController,
                          labelText: 'Email'),
                    )),
                AnimatedAlign(
                    curve: Curves.decelerate,
                    alignment: _alignSecondTextField,
                    duration: const Duration(milliseconds: 1800),
                    child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1800),
                        child: SignInUpTextFormField(
                            fieldController: _passwordController,
                            obscureText: true,
                            labelText: 'Password'))),
                AnimatedAlign(
                  curve: Curves.decelerate,
                  alignment: _alignSignUp,
                  duration: const Duration(milliseconds: 1900),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1900),
                    child: Row(
                      children: [
                        const Text(
                          'Dont have an account? ',
                          style: kSignInPageSmallTextStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUp.routeName);
                          },
                          child: Text(
                            'Sign Up.',
                            style: kSignInPageSmallTextStyle.copyWith(
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedAlign(
                  curve: Curves.decelerate,
                  alignment: _alignForgotPassword,
                  duration: const Duration(milliseconds: 2100),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 2100),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Text('Forgot Password?',
                          style: kSignInPageSmallTextStyle.copyWith(
                              color: Colors.blue)),
                    ),
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignSignInButton,
                  duration: const Duration(milliseconds: 2250),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 2250),
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signIn(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
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
                          child: Text('Sign in', style: kSignInUpButtonStyle),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
