import 'package:flutter/material.dart';
import 'package:refrescate/model/CarritosItems.dart';

class ProductList extends StatefulWidget {
  double width;
  double height;
  CarritosItems carritosItems;

  ProductList(this.width, this.height, this.carritosItems);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return cartItemsList(widget.width, widget.height, widget.carritosItems);
  }

  Align cartItemsList(
      double width, double height, CarritosItems carritosItems) {
    double extra = 0;
    if(carritosItems.cut != null){
      extra = double.parse(carritosItems.cut.aumento);
    }
    double itemPrice = carritosItems.cantidad == null
        ? double.parse(carritosItems.peso) * (carritosItems.producto.precio + extra)
        : carritosItems.cantidad * (carritosItems.producto.precio + extra);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Row(
          children: [
            Container(
              width: (width) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: height * 0.07,
                      width: width * 0.15,
                      child:
                          Image.network(carritosItems.producto.urlImagenes[0]),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        carritosItems.cut != null ?
                        carritosItems.producto.nombre + "("+carritosItems.cut.nombre+")": carritosItems.producto.nombre,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: (width) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    carritosItems.cantidad == null
                        ? carritosItems.peso + " g"
                        : "x" + carritosItems.cantidad.toString() + " ud",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    itemPrice.toStringAsFixed(2).replaceAll(".", ",") + "€",
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
      ),
    );
  }
}
