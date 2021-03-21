import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/globalMethods.dart';
import 'package:refrescate/ui/component/bottomMenu/Menu.dart';
import 'package:refrescate/ui/component/login/LoginPresenter.dart';
import 'package:refrescate/ui/component/register/mainRegisterView.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView{
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Map emailWidget = {"icon": Icons.visibility_outlined, "obscure": true};
  LoginPresenter _presenter ;
  RemoteRepository _remoteRepository;

  @override
  void initState() {
    _remoteRepository = HttpRemoteRepository(Client());
    _presenter = LoginPresenter(_remoteRepository, this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double sizeCut = 600.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  "Saltar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height < sizeCut ? height * 0.03 : height * 0.06,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: Text(
                "Inicio de sesión",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: height < sizeCut ? height * 0.06 : height * 0.1,
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(
                  left: width * 0.07,
                  right: width * 0.07),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: "Introduce el email",
                  labelText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1.5),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: width,
              padding:
                  EdgeInsets.only(left: width * 0.07, right: width * 0.07),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: emailWidget["obscure"],
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  suffixIcon: GestureDetector(
                    onTap: changeTypeText,
                    child: Icon(
                      emailWidget["icon"],
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1.5),
                  ),
                  labelText: "Contraseña",
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  "¿Has olvidado tu contraseña?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: RaisedButton(
                padding:
                    EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
                onPressed: () => _presenter.onLogin(email.text, password.text),
                child: Text(
                  "Iniciar sesión",
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
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => GlobalMethods().pushPage(context, MainRegisterView()),
                child: Text(
                  "Registrate",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeTypeText() {
    this.setState(() {
      emailWidget["obscure"] = !emailWidget["obscure"];
      emailWidget["icon"] = emailWidget["obscure"] ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    });
  }

  @override
  loginError() {
    throw UnimplementedError();

  }

  @override
  loginSuccessfully() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Menu()),
    );
  }
}
