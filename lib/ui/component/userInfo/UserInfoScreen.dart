import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

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

          Text("Datos del usuario",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
          SizedBox(
            height: 15.0,
          ),

          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
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
          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Apellidos",
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
          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
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
          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
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
            height: 25.0,
          ),

          Text("Direccion de entrega",style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
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
          Container(
            width: width,
            padding:
            EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nombre",
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
        ],
      ),
    );
  }
}
