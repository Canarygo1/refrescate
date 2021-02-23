import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/ui/component/bottomMenu/Menu.dart';
import 'package:refrescate/ui/component/home/HomeScreen.dart';
import 'package:refrescate/ui/component/order/OrderScreen.dart';
import 'package:refrescate/ui/component/productCart/ProductCartScreen.dart';

import 'data/cubit/cart_cubit.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RemoteRepository remoteRepository = HttpRemoteRepository(Client());
    return BlocProvider(
      create: ((context)=>CartCubit(remoteRepository)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Menu(),
      ),
    );
  }
}
