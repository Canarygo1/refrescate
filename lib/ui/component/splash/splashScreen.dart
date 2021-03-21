import 'package:flutter/material.dart';
import 'package:refrescate/ui/component/bottomMenu/Menu.dart';
import 'package:refrescate/ui/component/login/LoginScreen.dart';
import 'package:refrescate/ui/component/splash/splashPresenter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> implements SplashView{
  SplashPresenter _presenter;
  @override
  void initState() {
    _presenter = SplashPresenter(this);
    _presenter.checkUserLogged();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/letra-logo.png",height: 100,),
    );
  }

  @override
  userIsLogged() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => Menu()),
    );
  }

  @override
  userNotLogged() {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen()),
    );
  }
}
