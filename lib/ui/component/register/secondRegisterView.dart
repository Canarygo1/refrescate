import 'package:flutter/material.dart';
import 'package:refrescate/globalMethods.dart';
import 'package:refrescate/model/UserRegister.dart';
import 'package:refrescate/ui/component/register/finalRegisterView.dart';

class SecondRegisterView extends StatefulWidget {
  UserRegister userRegister;

  SecondRegisterView(this.userRegister);

  @override
  _SecondRegisterViewState createState() => _SecondRegisterViewState();
}

class _SecondRegisterViewState extends State<SecondRegisterView> {
  TextEditingController address = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repeatPassword = new TextEditingController();


  final _formKey = GlobalKey<FormState>();
  Map passwordWidget = {"icon": Icons.visibility_outlined, "obscure": true};
  Map password2Widget = {"icon": Icons.visibility_outlined, "obscure": true};
  Map phoneWidget = {"icon": Icons.close, "color": Colors.red};

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
                  "Necesitamos algunos\ndatos más",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(
                    left: width * 0.07,
                    right: width * 0.07,),
                child: TextFormField(
                  controller: address,
                  keyboardType: TextInputType.streetAddress,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: "Dirección",
                    labelText: "Dirección",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                  controller: phone,
                  validator: checkPhone,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      phoneWidget["icon"],
                      color: phoneWidget["color"],
                    ),
                    hintText: "Teléfono",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: "Teléfono",
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
                  obscureText: passwordWidget["obscure"],
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    suffixIcon: GestureDetector(
                      onTap: () => changeTypeText(true),
                      child: Icon(
                        passwordWidget["icon"],
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: "Contraseña",
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
                  controller: repeatPassword,
                  keyboardType: TextInputType.text,
                  obscureText: password2Widget["obscure"],
                  decoration: InputDecoration(
                    hintText: "Repite la contraseña",
                    suffixIcon: GestureDetector(
                      onTap: () => changeTypeText(false),
                      child: Icon(
                        password2Widget["icon"],
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: "Repite la contraseña",
                    labelStyle: TextStyle(
                      color: Colors.blue,
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
                child: ButtonTheme(
                  height: 50.0,
                  minWidth: width / 1.2,
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
                    onPressed: () => goNextScreen(),
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

  changeTypeText(bool first) {
    if (first) {
      this.setState(() {
        passwordWidget["obscure"] = !passwordWidget["obscure"];
        passwordWidget["icon"] = passwordWidget["obscure"] ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      });
    } else {
      this.setState(() {
        password2Widget["obscure"] = !password2Widget["obscure"];
        password2Widget["icon"] = password2Widget["obscure"] ? Icons.visibility_outlined : Icons.visibility_off_outlined;
      });
    }
  }

  String checkPhone(String value) {
    if(value.isEmpty){
      phoneWidget["icon"] = Icons.close;
      phoneWidget["color"] = Colors.red;
      return "Debe rellenar el campo";
    }else {
      bool pattern = RegExp(
          r"^\d{9}$")
          .hasMatch(value);
      if(!pattern){
        phoneWidget["icon"] = Icons.close;
        phoneWidget["color"] = Colors.red;
        return "Formato de teléfono incorrecto";
      }else{
        phoneWidget["icon"] = Icons.check;
        phoneWidget["color"] = Colors.green;
        return null;
      }
    }
  }
  goNextScreen(){
    widget.userRegister.address = address.text;
    widget.userRegister.phoneNumber = phone.text;
    widget.userRegister.password = password.text;
    GlobalMethods().pushPage(context, FinalRegisterView(widget.userRegister));
  }
}
