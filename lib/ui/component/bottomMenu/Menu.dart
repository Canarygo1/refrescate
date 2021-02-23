import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/data/local/LocalRepository.dart';
import 'package:refrescate/data/local/SqLiteLocalRepository.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/ui/component/bottomMenu/MenuPresenter.dart';
import 'package:refrescate/ui/component/home/HomeScreen.dart';
import 'package:refrescate/ui/component/order/OrderScreen.dart';
import 'package:refrescate/ui/component/productCart/ProductCartScreen.dart';
import 'package:refrescate/ui/component/register/mainRegisterView.dart';

class Menu extends StatefulWidget {
  Menu();

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> implements MenuView {
  int selectedItem = 1;
  int aux;
  List<Widget> screens = [OrderScreen(), HomeScreen(), MainRegisterView()];
  MenuPresenter presenter;
  RemoteRepository remoteRepository;
  LocalRepository localRepository;

  @override
  Future<void> initState() {
    final cartCubit = context.read<CartCubit>();

    remoteRepository = HttpRemoteRepository(Client());
    localRepository = SqLiteLocalRepository();
    //TODO: Iniciarlo y pasarselo al presenter.
    presenter = MenuPresenter(this, cartCubit);
    presenter.getActiveCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return screens.length == 0
        ? SpinKitPulse(
            color: Colors.black,
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leadingWidth: width / 2,
              leading: Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Refrescate",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Container(
                alignment: Alignment.centerRight,
                child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if(state is CartLoaded) {
                        return appBarCart(state.cart);
                      }
                      return Container();
                }),
              ),
              titleSpacing: 0,
            ),
            body: screens[selectedItem],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                      caption: TextStyle(color: Colors.white),
                    ),
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.assignment_rounded,
                        color: Colors.black,
                      ),
                      title: Text(""),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      title: Text(""),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                      ),
                      title: Text(""),
                    ),
                  ],
                  currentIndex: selectedItem,
                  onTap: showScreen),
            ),
          );
  }

  GestureDetector appBarCart(Cart cart) {
    return GestureDetector(
                  onTap: () => goToCart(),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0, top: 8.0),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        width: 25.0,
                        height: 25.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(15, 150, 20, 0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "+" + cart.carritosItems.length.toString() ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }

  @override
  showScreen(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductCartScreen()),
    );
  }
}
