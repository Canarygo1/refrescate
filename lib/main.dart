import 'package:flutter/material.dart';
import 'package:refrescate/ui/component/bottomMenu/Menu.dart';
import 'package:refrescate/ui/component/login/LoginView.dart';
import 'package:refrescate/ui/component/orderInfo/OrderInfoView.dart';
import 'package:refrescate/ui/component/productCart/ProductCartView.dart';
import 'package:refrescate/ui/component/productInfo/ProductInfoView.dart';
import 'package:refrescate/ui/component/register/finalRegisterView.dart';
import 'package:refrescate/ui/component/register/mainRegisterView.dart';
import 'package:refrescate/ui/component/register/secondRegisterView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
    );
  }
}
