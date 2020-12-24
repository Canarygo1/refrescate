import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ProductCartView extends StatefulWidget {
  @override
  _ProductCartViewState createState() => _ProductCartViewState();
}

class _ProductCartViewState extends State<ProductCartView>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  DateTime _selectedDay = DateTime.now();

  void initState() {
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
                          height: height * 0.4,
                          child: ListView.builder(
                              itemExtent: 185 / 2.7,
                              primary: false,
                              itemCount: 6,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, indexTipo) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: (width) / 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              height: height * 0.07,
                                              width: width * 0.15,
                                              child: Image.asset("assets/trashIcon.png"),
                                            ),
                                            Text(
                                              "Cerveza Turia\n12 unidades",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: (width) / 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "x2",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Text(
                                              "6,90€",
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
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Divider(
                          thickness: 3,
                          endIndent: 10.0,
                          indent: 10.0,
                          color: Colors.blue,
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
                                "2,93€",
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
                          height: 15.0,
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
    String day = dateTime.weekday == 3 ? "X" : DateFormat("EEEE").format(dateTime).substring(0, 1).toUpperCase();
    return day;
  }
}
