import 'dart:ui';

import 'package:flutter/material.dart';

class OrderInfoView extends StatefulWidget {
  @override
  _OrderInfoViewState createState() => _OrderInfoViewState();
}

class _OrderInfoViewState extends State<OrderInfoView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double sizeCut = 600.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.8, 0.8],
                colors: [Colors.blue, Colors.white]),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: height < sizeCut ? height * 0.015 : height * 0.04,
              ),
              Container(
                padding: EdgeInsets.only(right: 20.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "#EDO1234",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Fecha de entrega",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Viernes 8 de Noviembre 2020",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height < sizeCut ? height * 0.025 : height * 0.05,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 80.0),
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: Text(
                            "Lista de productos",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: height < sizeCut ? height * 0.28 : height * 0.38,
                          child: ListView.builder(
                              itemExtent: 185 / 2.7,
                              primary: false,
                              itemCount: 6,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, indexTipo) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: (width) / 2,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                BorderRadius.circular(5.0),
                                              ),
                                              height: height * 0.07,
                                              width: width * 0.15,
                                              child: Image.asset("assets/trashIcon.png"),
                                            ),
                                            Text(
                                              "Cerveza Turia\n12 unidades",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: (width) / 2,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "x2",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Text(
                                              "6,90€",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Divider(
                          thickness: 3,
                          endIndent: 10.0,
                          indent: 10.0,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: height < sizeCut ? height * 0.03 : height * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "2,93€",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height < sizeCut ? height * 0.05 : 0.0,
                    right: width * 0.08,
                    child: Image.asset(
                        "assets/trashIcon.png",
                      scale: height < sizeCut ? 4.5 : 3.5,
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 20.0,
                    child: Text(
                      "Precio Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 20.0,
                    child: Text(
                      "30€",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
