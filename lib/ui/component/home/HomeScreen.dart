import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/ui/component/productCart/ProductCartScreen.dart';
import 'package:refrescate/ui/component/productInfo/ProductInfoScreen.dart';
import 'HomePresenter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter presenter;
  RemoteRepository remoteRepository;
  List<Product> allProducts = [];

  @override
  void initState() {
    remoteRepository = HttpRemoteRepository(Client());
    presenter = HomePresenter(this, remoteRepository);
    presenter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int colCounter = 0;
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
                itemCount: (allProducts.length / 2).ceil(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    height: 230.0,
                    child: ListView.builder(
                        itemExtent: width / 2,
                        shrinkWrap: true,
                        primary: false,
                        itemCount:
                            (colCounter + 2) > allProducts.length ? 1 : 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          colCounter++;
                          int currentCol = colCounter - 1;
                          return GestureDetector(
                            onTap: () => goToProductDetail(currentCol),
                            child: Container(
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
                                    allProducts[colCounter - 1]
                                        .nombre
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    allProducts[colCounter - 1]
                                        .cantidadLote
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    allProducts[colCounter - 1]
                                        .precio
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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

  @override
  setProducts(List<Product> products) {
    setState(() {
      allProducts = products;
    });
  }

  goToProductDetail(int productCol) {
    print(productCol);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductInfoScreen(product: allProducts[productCol])),
    );
  }

}
