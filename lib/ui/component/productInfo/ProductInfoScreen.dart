import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/globalMethods.dart';
import 'package:refrescate/model/CarritosItems.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/ui/component/login/LoginScreen.dart';
import 'package:refrescate/ui/component/productCart/ProductCartScreen.dart';
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
  var observationsController = TextEditingController();

  int selectCut = 0;
  bool loading = false;
  FocusNode _focus = new FocusNode();
  bool user = false;
  @override
  void initState() {
    final cartCubit = context.read<CartCubit>();

    remoteRepository = HttpRemoteRepository(Client());
    presenter = ProductInfoPresenter(this, remoteRepository, cartCubit);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double sizeCut = 600.0;
    int _value = 0;
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;

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
                stops: [0.45, 0.2],
                colors: [Colors.red, Colors.white]),
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
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                    if (state is CartLoaded) {
                                      user = true;
                                      print("Widget Id " + widget.product.id);
                                      //Todo estaria bien hacerlo en otro sitio para capturar posible errores.
                                      carritoItem =
                                          state.cart.carritosItems.where(
                                                  (element) =>
                                                  element.producto.id
                                                      .contains(
                                                      widget.product.id));

                                      return Text(
                                        carritoItem.isEmpty
                                            ?  widget.product.tipoUnidad == "Unidades"? "0 Unidades": "0 Gramos"
                                            :
                                        carritoItem.first.producto.tipoUnidad ==
                                            "Unidades"
                                            ? carritoItem.first.cantidad
                                            .toString() + " Unidades"
                                            : carritoItem.first.peso
                                            .toString() + " Gramos",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      );
                                    }
                                    return Container();
                                  }),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                        size: 45.0,
                                      ),
                                      onPressed: () => user == true ? carritoItem.isNotEmpty && loading ==false ? onDelete( carritoItem.first.id) : null : GlobalMethods().pushAndReplacement(context, LoginScreen())),
                                  Text(
                                    " - ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(

                                      fontSize: 45.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                 IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.red,
                                          size: 45.0,
                                        ),
                                        onPressed: () => user == true ?loading == false ?  onAdd(): null : GlobalMethods().pushAndReplacement(context, LoginScreen())),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        widget.product.caracteristica == null
                            ? Container()
                            : Padding(

                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Corte",
                                style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Container(
                                height: 40.0,
                                alignment: Alignment.centerLeft,
                                child: ListView.builder(
                                    itemExtent: width / 4,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: widget.product.caracteristica
                                        .caracteristicas.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0),
                                        child: GestureDetector(
                                          onTap: () =>
                                          {

                                            setState(() {
                                              selectCut = index;
                                              carritoItem.isEmpty
                                                  ? null
                                                  : presenter.updateProductCart(
                                                  carritoItem.first.id,
                                                  carritoItem.first.producto.tipoUnidad,
                                                  carritoItem.first.cantidad,
                                                  carritoItem.first.peso,
                                                  observationsController.text,
                                                  cutId: widget.product
                                                      .caracteristica
                                                      .caracteristicas[selectCut]
                                                      .id);
                                            })
                                          },
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                widget.product.caracteristica
                                                    .caracteristicas[index]
                                                    .nombre, style: TextStyle(
                                                  color: Colors.white),
                                                maxLines: 2,),
                                            ),
                                            height: 40.0,
                                            width: 200.0,

                                            decoration: BoxDecoration(
                                              color: index == selectCut ? Colors
                                                  .red : Color.fromRGBO(
                                                  41, 41, 41, 1),
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),


                            ],

                          ),
                        ),
                        Padding(

                          padding: EdgeInsets.only(left: 20.0, right: 20, bottom: bottomInsets /2),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Observaciones',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Focus(
                                onFocusChange:(hasFocus) => {hasFocus ? null : carritoItem.isEmpty ? null : presenter.updateProductObservations(carritoItem.first.id, observationsController.text)} ,
                                child: TextField(
                                  controller: observationsController,
                                  scrollPadding: EdgeInsets.only(bottom:bottomInsets + 50),
                                  decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.teal)
                                    ),),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
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
                                      Iterable<
                                          CarritosItems> carritoItem = state
                                          .cart.carritosItems
                                          .where((element) =>
                                          element.producto.id
                                              .contains(widget.product.id));
                                      double precio = 0;
                                      loading = false;
                                      double extra = 0;
                                      if(carritoItem.isEmpty){}
                                      else{
                                        if(carritoItem.first.cut != null){
                                          extra = double.parse(carritoItem.first.cut.aumento);
                                        }
                                      if(carritoItem.first.producto.tipoUnidad == "Unidades") {
                                         precio = carritoItem.isEmpty
                                            ? 0
                                            : carritoItem.first.cantidad *(
                                            carritoItem.first.producto.precio +extra);
                                      }
                                      else{
                                         precio = carritoItem.isEmpty
                                            ? 0
                                            : double.parse(carritoItem.first.peso) * (
                                            carritoItem.first.producto.precio + extra);
                                      }}
                                      return Text(
                                        precio.toStringAsFixed(2) + "€",
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

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () =>Navigator.of(context).pop(),
                                child: Text(
                                  "Continuar Comprando",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Color.fromRGBO(247, 247, 247, 1),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 150,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () => goToCart(),
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
                    child: Container(
                      width: 150,
                      height: 150,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(
                        widget.product.urlImagenes[0],
                          scale: height < sizeCut ? 1000 : 0.9,
                        ),
                      ),
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
                      widget.product.precio.toStringAsFixed(2) +
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

  onDelete(String cartItemId){
      if(carritoItem.first.producto.tipoUnidad == "Unidades"){
        if(carritoItem.first.cantidad -1 == 0){
          loading = true;
          presenter.deleteProductCart(cartItemId);
        }else{
          loading = true;

          presenter.updateProductCart(
              carritoItem.first.id,
              carritoItem.first.producto.tipoUnidad,
              carritoItem.first.cantidad -
                  1,carritoItem.first.peso,observationsController.text);
        }
      }else{
        if(double.parse(carritoItem.first.peso) - 0.250 == 0){
          loading = true;
          presenter.deleteProductCart(cartItemId);
        }else{
          loading = true;
          presenter.updateProductCart(cartItemId, carritoItem.first.producto.tipoUnidad, carritoItem.first.cantidad, (double.parse(carritoItem.first.peso) - 0.250).toString(),observationsController.text);
        }
      }
    }
    onAdd(){
    if(carritoItem.isEmpty) {
      loading = true;
      presenter.addProductToCart(
          widget.product.id,
          widget.product.tipoUnidad,
          observationsController.text,
          cutId: widget.product
              .caracteristica == null
              ? null
              : widget.product.caracteristica
              .caracteristicas[selectCut].id);
    }else{
      loading = true;
      if(carritoItem.first.producto.tipoUnidad=="Unidades"){
        presenter.updateProductCart(
            carritoItem.first.id,
            carritoItem.first.producto.tipoUnidad,
            carritoItem.first.cantidad+1,
            carritoItem.first.peso==null ? null :(double.parse(carritoItem.first.peso)+0.250).toString(),
            observationsController.text,
            cutId: widget.product
                .caracteristica == null
                ? null
                : widget.product.caracteristica
                .caracteristicas[selectCut].id);
      }else{
      presenter.updateProductCart(
              carritoItem.first.id,
              carritoItem.first.producto.tipoUnidad,
              carritoItem.first.cantidad,
              carritoItem.first.peso==null ? null :(double.parse(carritoItem.first.peso)+0.250).toString(),
            observationsController.text,
          cutId: widget.product
                  .caracteristica == null
                  ? null
                  : widget.product.caracteristica
                  .caracteristicas[selectCut].id);
        }
      }
    }
  goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductCartScreen()),
    );
  }
}
