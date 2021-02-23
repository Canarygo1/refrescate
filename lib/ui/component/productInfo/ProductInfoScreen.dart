import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/CarritosItems.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/ui/component/productInfo/ProductInfoPresenter.dart';

class ProductInfoScreen extends StatefulWidget {
  final Product product;

  const ProductInfoScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductInfoScreenState createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen>
    implements ProductInfoView {
  ProductInfoPresenter presenter;
  RemoteRepository remoteRepository;
  String productQuantity;
  Iterable<CarritosItems> carritoItem;

  @override
  void initState() {
    final cartCubit = context.read<CartCubit>();

    remoteRepository = HttpRemoteRepository(Client());
    presenter = ProductInfoPresenter(this, remoteRepository, cartCubit);
    super.initState();
  }

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
                  widget.product.nombre,
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
                          height:
                              height < sizeCut ? height * 0.09 : height * 0.15,
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
                            widget.product.descripcion,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              height < sizeCut ? height * 0.03 : height * 0.07,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.blue,
                                        size: 35.0,
                                      ),
                                      onPressed: () => carritoItem.isEmpty
                                          ? null
                                          : carritoItem.first.cantidad - 1 == 0
                                              ? presenter.deleteProductCart(
                                                  carritoItem.first.id)
                                              : presenter.updateProductCart(
                                                  carritoItem.first.id,
                                                  carritoItem.first.cantidad -
                                                      1)),
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
                                      onPressed: () => carritoItem.isEmpty
                                          ? presenter.addProductToCart(
                                              widget.product.id)
                                          : presenter.updateProductCart(
                                              carritoItem.first.id,
                                              carritoItem.first.cantidad + 1)),
                                ],
                              ),
                              BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                if (state is CartLoaded) {
                                  print("Widget Id " + widget.product.id);
                                  //Todo estaria bien hacerlo en otro sitio para capturar posible errores.
                                  carritoItem = state.cart.carritosItems.where(
                                      (element) => element.producto.id
                                          .contains(widget.product.id));

                                  return Text(
                                    carritoItem.isEmpty
                                        ? "0 Unidades"
                                        : carritoItem.first.cantidad
                                                .toString() +
                                            " Unidades",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  );
                                }
                                return Container();
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              height < sizeCut ? height * 0.03 : height * 0.05,
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
                              BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                if (state is CartLoaded) {
                                  Iterable<CarritosItems> carritoItem = state
                                      .cart.carritosItems
                                      .where((element) => element.producto.id
                                          .contains(widget.product.id));
                                  double precio = carritoItem.isEmpty
                                      ? 0
                                      : carritoItem.first.cantidad *
                                          carritoItem.first.producto.precio;
                                  return Text(
                                    precio.toString() + "€",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  );
                                }
                                return Container();
                              })
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
                      widget.product.precio.toString() +
                          "€ / " +
                          widget.product.cantidadLote.toString() +
                          " " +
                          widget.product.tipoUnidad,
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

  @override
  productQuantityError() {
    // TODO: implement productQuantityError
    throw UnimplementedError();
  }

  @override
  productQuantityUpdated(int quantity) {
    // TODO: implement productQuantityUpdated
    throw UnimplementedError();
  }

  @override
  setInitialQuantity(String initialQuantity) {
    setState(() {
      productQuantity = initialQuantity;
    });
  }
}
