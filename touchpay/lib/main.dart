// Wordy
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touchpay/util/theme.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/page/splash/splash_page.dart';
import 'package:touchpay/page/welcome/welcome_screen.dart';
import 'package:touchpay/page/home/home_navigator.dart';

void main() => runApp(TouchPay());

class TouchPay extends StatefulWidget {
  @override
  _TouchPayState createState() => _TouchPayState();
}

class _TouchPayState extends State<TouchPay> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: theme(),
      initialRoute: AppConstant.pageSplash,
      routes: {
        AppConstant.pageSplash: (context) => SplashPage(),
        AppConstant.pageWelcome: (context) => WelcomeScreen(),
        AppConstant.pageHome: (context) => HomeNavigator(),
      },
    );
  }
}
