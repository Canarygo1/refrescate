import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Usuario.dart';
import 'package:refrescate/ui/component/login/LoginScreen.dart';
import 'package:refrescate/ui/component/userInfo/UserInfoPresenter.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen>
    implements UserInfoView {
  UserInfoPresenter _presenter;
  RemoteRepository _remoteRepository;
  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();


  @override
  void initState() {
    _remoteRepository = HttpRemoteRepository(Client());
  _presenter = UserInfoPresenter(this, _remoteRepository);
  _presenter.getUserInfo();
    super.initState();
  }
  Usuario user;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Datos del usuario",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              controller: nameController,
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Nombre",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              controller: surnameController,
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Apellidos",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Apellidos",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              controller: phoneNumberController,
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Nombre",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Nombre",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Direccion de entrega",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Nombre",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                labelText: "Nombre",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            width: width,
            alignment: Alignment.center,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
              onPressed: () => {},
              child: Text(
                "Guardar cambios",
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
              onPressed: () => _presenter.logOut(),
              child: Text(
                "Cerrar sesión",
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
    );
  }

  @override
  logOut() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
            (Route<dynamic> route) => route is LoginScreen
    );
  }

  @override
  setUserInfo(user) {
    nameController.text = user.nombre;
    surnameController.text = user.apellidos;
    phoneNumberController.text = user.telefono;
  }
}
