import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_json/signin/signin_page.dart';
import 'package:sample_json/signin_code/signin_code_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = const SignInCodePage();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? boolValue = prefs.getBool('valid_user');
  if(boolValue == true){
    _defaultHome = const HomePage();
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/signin_code': (BuildContext context) => const SignInCodePage(),
        '/signin': (BuildContext context) => const SignInPage(),
        '/home': (BuildContext context) => const HomePage(),
      },
    ));
  });
}
