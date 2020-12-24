import 'package:flutter/material.dart';

class ProductInfoView extends StatefulWidget {
  @override
  _ProductInfoViewState createState() => _ProductInfoViewState();
}

class _ProductInfoViewState extends State<ProductInfoView> {
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
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "1 Unidad",
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
                  "Botella 8L Fonteinde",
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
                          height: height < sizeCut ? height * 0.09 : height * 0.15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Información",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Text(
                            'Agua mineral de mineralización débil, de las cumbres de la Orotava.\nApta para bebés.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height < sizeCut ? height * 0.03 : height * 0.07,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Cantidad',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.blue,
                                        size: 35.0,
                                      ),
                                      onPressed: () => {}),
                                  Text(
                                    " - ",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.blue,
                                        size: 35.0,
                                      ),
                                      onPressed: () => {}),
                                ],
                              ),
                              Text(
                                "2 Unidades",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
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
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "2,93€",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () => {},
                                child: Text(
                                  "Continuar Comprando",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Color.fromRGBO(56, 118, 200, 1),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 150,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () => {},
                                child: Text(
                                  "Finalizar compra",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.green,
                              ),
                            ),
                          ],
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
                      "Precio",
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
                      "1,46€/unidad",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
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
