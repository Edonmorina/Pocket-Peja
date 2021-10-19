import 'package:flutter/material.dart';
import 'package:pocket_peja/screen/auth_screens/sign_up.dart';
import 'package:pocket_peja/screen/main_screens/loading_screen.dart';
import 'package:pocket_peja/screen/auth_screens/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:pocket_peja/provider_data.dart';
import 'screen/menu/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocket_peja/authentication/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pocket Peja',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoadingScreen.routeName,
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          LoadingScreen.routeName: (context) => LoadingScreen(),
          SignIn.routeName: (context) => SignIn(),
          SignUp.routeName: (context) => SignUp(),
        },
      ),
    );
  }
}
