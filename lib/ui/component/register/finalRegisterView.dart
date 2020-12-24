import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:refrescate/globalMethods.dart';

class FinalRegisterView extends StatefulWidget {
  FinalRegisterView();

  @override
  _FinalRegisterViewState createState() => _FinalRegisterViewState();
}

class _FinalRegisterViewState extends State<FinalRegisterView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => GlobalMethods().popPage(context),
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: Text(
                "Código verificación",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.2),
              width: width,
              alignment: Alignment.center,
              child: Text(
                "Te hemos enviado un SMS para verificar tu teléfono",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(left: 20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Código",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Container(
              child: PinCodeFields(
                length: 4,
                margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                keyboardType: TextInputType.number,
                borderWidth: 5.0,
                borderColor: Colors.black,
                animationDuration: Duration(milliseconds: 200),
                onComplete: (output) {
                  print(output);
                },
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: ButtonTheme(
                height: 50.0,
                minWidth: width / 1.2,
                child: RaisedButton(
                  onPressed: () => GlobalMethods().removePages(context),
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Color.fromRGBO(56, 118, 200, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
