import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/CarritosItems.dart';
import 'package:refrescate/model/MaskedTextInputFormatter.dart';
import 'package:refrescate/model/PaymentData.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/ui/component/Payment/PaymentScreen.dart';
import 'package:refrescate/ui/component/ProductList.dart';
import 'package:refrescate/ui/component/productCart/ProductCartPresenter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({Key key}) : super(key: key);

  @override
  _ProductCartScreenState createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen>
    with TickerProviderStateMixin
    implements ProductCartView {
  AnimationController _animationController;
  CalendarController _calendarController;
  DateTime _selectedDay = DateTime.now();
  ProductCartPresenter presenter;
  String totalPrice;
  Cart currentCart;
  bool orderStatus = false;
  StateSetter alertOrderSetState;

  _afterLayout() async {
    await presenter.calculateFinalPrice(currentCart);
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterLayout());
    final cartCubit = context.read<CartCubit>();
    totalPrice = "0";
    presenter = ProductCartPresenter(this, cartCubit);
    initializeDateFormatting("es_ES");
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      key: Key("TEST01"),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.4],
                colors: [Colors.red, Colors.white]),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Fecha de entrega",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: width,
                alignment: Alignment.topCenter,
                child: _buildTableCalendar(),
              ),
              SizedBox(
                height: 25.0,
              ),
              Stack(
                children: [
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: Text(
                            "Lista de productos",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: height * 0.35,
                          child: BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                            if (state is CartLoaded) {
                              currentCart = state.cart;
                              return ListView.builder(
                                  itemExtent: 185 / 2.7,
                                  primary: false,
                                  itemCount: state.cart.carritosItems.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, indexTipo) {
                                    CarritosItems carritosItem =
                                        state.cart.carritosItems[indexTipo];
                                    return ProductList(
                                        width, height, carritosItem);
                                  });
                            }

                            return Container();
                          }),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Divider(
                          thickness: 3,
                          endIndent: 10.0,
                          indent: 10.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                totalPrice + "€",
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
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () => {Navigator.of(context).pop()},
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
                                onPressed: () => {
                                  presenter.createOrder(
                                      totalPrice, _selectedDay),
                                },
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      initialSelectedDay: _selectedDay,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.white,
        selectedStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        todayColor: Colors.transparent,
        outsideDaysVisible: false,
        weekdayStyle: TextStyle(
          color: Colors.white,
        ),
        weekendStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        dowTextBuilder: getInitialLetterDays,
        weekendStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      initialCalendarFormat: CalendarFormat.week,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        centerHeaderTitle: true,
        leftChevronMargin: EdgeInsets.all(0.0),
        rightChevronMargin: EdgeInsets.all(0.0),
        leftChevronIcon: Icon(
          Icons.arrow_left,
          color: Colors.white,
          size: 45.0,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_right,
          color: Colors.white,
          size: 45.0,
        ),
        titleTextBuilder: titleText,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      enabledDayPredicate: checkDay,
      onDaySelected: _onDaySelected,
    );
  }

  String titleText(dateTime, dynamic) {
    Intl.defaultLocale = "es_ES";
    return DateFormat("EEEE").format(_selectedDay) +
        " " +
        _selectedDay.day.toString() +
        " de " +
        DateFormat("MMMM").format(_selectedDay) +
        " de " +
        _selectedDay.year.toString();
  }

  bool checkDay(DateTime dateTime) {
    DateTime actualDay = DateTime.now().subtract(Duration(
      hours: DateTime.now().hour,
      microseconds: DateTime.now().microsecond,
      milliseconds: DateTime.now().millisecond,
      minutes: DateTime.now().minute,
      seconds: DateTime.now().second,
    ));
    if (dateTime.isBefore(actualDay)) {
      return false;
    } else {
      return true;
    }
  }

  String getInitialLetterDays(DateTime dateTime, dynamic) {
    Intl.defaultLocale = "es_ES";
    String day = dateTime.weekday == 3
        ? "X"
        : DateFormat("EEEE").format(dateTime).substring(0, 1).toUpperCase();
    return day;
  }

  @override
  setFinalPrice(double finalPrice) {
    setState(() {
      totalPrice = finalPrice.toStringAsFixed(2);
    });
  }

  @override
  changeOrderStatus(PaymentData paymentData) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(paymentData: paymentData,),
        ));
  }
}
