import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_peja/authentication/authentication_wrapper.dart';
import 'package:provider/provider.dart';
import '../../provider_data.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = '/loadingScreen';
  final String assetName = 'assets/river.svg';

  @override
  Widget build(BuildContext context) {
    Future<void> _getData() async {
      await Provider.of<Data>(context, listen: false).getLocation();
    }

    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          Size size = MediaQuery.of(context).size;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF2BCE5A), Color(0xFF69B8D4)],
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight)),
                child: Stack(
                  children: [
                    SimpleShadow(
                      child: Align(
                        alignment: const Alignment(0.0, -0.2),
                        child: SvgPicture.asset(
                          assetName,
                          height: size.height * 0.175,
                        ),
                      ),
                    ),
                    // const Align(
                    //   alignment: Alignment(0.0, 0.2),
                    //   child: CircularProgressIndicator(
                    //     color: Colors.black87,
                    //     strokeWidth: 3,
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
          return AuthenticationWrapper();
        });
  }
}
