import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/category.dart';
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
  List<Category> mainCategories = [];
  List<Product> filterProducts = [];
  String categoryFilterId = "";
  @override
  void initState() {
    remoteRepository = HttpRemoteRepository(Client());
    presenter = HomePresenter(this, remoteRepository);
    presenter.init();
    presenter.getCategories();
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
            child: Scrollbar(
              isAlwaysShown: true,

              child: ListView.builder(
                  itemExtent: width / 4,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: mainCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            presenter.categoryFilter(
                                allProducts, mainCategories[index].id)
                          },
                          child: Container(
                            child: Image.network(mainCategories[index].iconUrl),
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: categoryFilterId == mainCategories[index].id ? Color.fromRGBO(41, 41, 41, 1):Colors.black12,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          mainCategories[index].nombre,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              mainCategories[mainCategories.indexWhere((element) =>categoryFilterId == element.id)].nombre,
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
                itemCount: filterProducts.isEmpty ? (allProducts.length / 2).ceil():(filterProducts.length / 2).ceil(),
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
                        filterProducts.isEmpty ? (colCounter + 2) > allProducts.length ? 1 : 2:(colCounter + 2) > filterProducts.length ? 1 : 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          colCounter++;
                          int currentCol = colCounter - 1;
                          Product product = filterProducts.isEmpty ? allProducts[colCounter - 1]:filterProducts[colCounter - 1];

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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    height: 137.0,
                                    child: Image.network(product.urlImagenes[0]),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    product
                                        .nombre
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    product
                                        .cantidadLote
                                        .toString()+" "+product.tipoUnidad,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    product
                                        .precio
                                        .toStringAsFixed(2)+" €",
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
      MaterialPageRoute(
          builder: (context) =>
              ProductInfoScreen(product: allProducts[productCol])),
    );
  }

  @override
  setCategories(List<Category> categories) {
    setState(() {
      mainCategories = categories;
    });
  }

  @override
  setProductsFilter(List<Product> filterProducts, String filterCategoryId) {
    setState(() {
      this.filterProducts = filterProducts;
      this.categoryFilterId = filterCategoryId;
    });
  }
}
