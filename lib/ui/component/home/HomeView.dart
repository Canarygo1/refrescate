import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            child: ListView.builder(
                itemExtent: width / 4,
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, indexTipo) {
                  return Column(
                    children: [
                      Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Hola",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Todos",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            alignment: Alignment.center,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, indexTipo) {
                  return Container(
                    alignment: Alignment.center,
                    height: 230.0,
                    child: ListView.builder(
                        itemExtent: width / 2,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, indexTipo) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 120.0,
                                  child: Image.asset("assets/trashIcon.png"),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "Botella fonteine",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "1 unidad",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "12,20€",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
