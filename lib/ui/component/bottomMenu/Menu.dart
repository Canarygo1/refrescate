import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refrescate/ui/component/home/HomeView.dart';
import 'package:refrescate/ui/component/order/OrderScreen.dart';
import 'package:refrescate/ui/component/register/mainRegisterView.dart';

class Menu extends StatefulWidget {
  Menu();

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedItem = 1;
  int aux;
  List<Widget> screens = [OrderScreen(), HomeView(), MainRegisterView()];

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
                        "+2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
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

  @override
  showScreen(int index) {
    setState(() {
      selectedItem = index;
    });
  }
}
