import 'package:flutter/material.dart';
import 'package:refrescate/globalMethods.dart';
import 'package:refrescate/model/UserRegister.dart';
import 'package:refrescate/ui/component/register/secondRegisterView.dart';

class MainRegisterView extends StatefulWidget {
  @override
  _MainRegisterViewState createState() => _MainRegisterViewState();
}

class _MainRegisterViewState extends State<MainRegisterView> {
  UserRegister _userRegister = UserRegister();
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map emailWidget = {"icon": Icons.close, "color": Colors.red};
  Map nameWidget = {"icon": Icons.close, "color": Colors.red};
  Map surNameWidget = {"icon": Icons.close, "color": Colors.red};

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
                height: height * 0.03,
              ),
              Container(
                width: width,
                alignment: Alignment.center,
                child: Text(
                  "Registro",
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
                  "Datos iniciales",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(
                    left: width * 0.07,
                    right: width * 0.07,),
                child: TextFormField(
                  validator: checkEmail,
                  autovalidateMode: AutovalidateMode.always,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      emailWidget["icon"],
                      color: emailWidget["color"],
                    ),
                    hintText: "Email",
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
                  controller: name,
                  validator: (value) => checkNameAndSurname(value, true),
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Nombre",
                    suffixIcon: Icon(
                      nameWidget["icon"],
                      color: nameWidget["color"],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 1.5),
                    ),
                    labelText: "Nombre",
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
                  controller: surname,
                  validator: (value) => checkNameAndSurname(value, false),
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Apellidos",
                    suffixIcon: Icon(
                      surNameWidget["icon"],
                      color: surNameWidget["color"],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 1.5),
                    ),
                    labelText: "Apellidos",
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
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
                    onPressed: () =>goNextScreen(),
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
      ),
    );
  }

  String checkEmail(String value){
    if(value.isEmpty){
      emailWidget["icon"] = Icons.close;
      emailWidget["color"] = Colors.red;
      return "Debe rellenar el campo";
    }else {
      bool pattern = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if(!pattern){
        emailWidget["icon"] = Icons.close;
        emailWidget["color"] = Colors.red;
        return "Formato de email incorrecto";
      }else{
        emailWidget["icon"] = Icons.check;
        emailWidget["color"] = Colors.green;
        return null;
      }
    }
  }

  String checkNameAndSurname(String value, bool first){
    if(value.isEmpty){
      first ? nameWidget["icon"] = Icons.close : surNameWidget["icon"] = Icons.close;
      first ? nameWidget["color"] = Colors.red : surNameWidget["color"] = Colors.red;
      return "Debe rellenar el campo";
    }else {
      bool pattern = RegExp(
          r'^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$')
          .hasMatch(value);
      if(!pattern){
        first ? nameWidget["icon"] = Icons.close : surNameWidget["icon"] = Icons.close;
        first ? nameWidget["color"] = Colors.red : surNameWidget["color"] = Colors.red;
        return "Formato de campo incorrecto";
      }else{
        first ? nameWidget["icon"] = Icons.check : surNameWidget["icon"] = Icons.check;
        first ? nameWidget["color"] = Colors.green : surNameWidget["color"] = Colors.green;
        return null;
      }
    }
  }
  goNextScreen(){
    _userRegister.name = name.text;
    _userRegister.email = email.text;
    _userRegister.surname = surname.text;
    GlobalMethods().pushPage(context, SecondRegisterView(_userRegister));
  }
}
