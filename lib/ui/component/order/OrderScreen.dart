import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';
import 'package:refrescate/ui/component/order/OrderPresenter.dart';
import 'package:refrescate/ui/component/orderInfo/OrderInfoView.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> implements OrderView {
  OrderPresenter presenter;
  RemoteRepository remoteRepository;
  List<Order> orders = [];

  @override
  void initState() {
    remoteRepository = HttpRemoteRepository(Client());
    presenter = OrderPresenter(this, remoteRepository);
    presenter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Pedidos activos",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: orders.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  String id = orders[index].id.split("-")[0];
                  List<String> date = orders[index].fechaEntrega.split("-");
                  return Container(
                    margin: EdgeInsets.all(20.0),
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.03,
                            0.03
                          ],
                          colors: [
                            Colors.green,
                            Color.fromRGBO(247, 247, 247, 1)
                          ]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "#" + id,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          date[2]+'-'+date[1]+'-'+date[0],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          orders[index].precioTotal.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderInfoView(order: orders[index])))
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            child: Text(
                              "Ver pedido",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  setOrders(List<Order> newOrders) {
    setState(() {
      orders = newOrders;
    });
  }
}
