import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:refrescate/globalMethods.dart';
import 'package:refrescate/model/UserRegister.dart';

class FinalRegisterView extends StatefulWidget {
  UserRegister userRegister;
  FinalRegisterView(this.userRegister);

  @override
  _FinalRegisterViewState createState() => _FinalRegisterViewState();
}

class _FinalRegisterViewState extends State<FinalRegisterView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    sendSMS();
    // TODO: implement initState
    super.initState();
  }
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
  sendSMS() async {
    var test = await auth.verifyPhoneNumber(
      phoneNumber:"+34 607 97 76 02",
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '123456';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
    );
  }
}
