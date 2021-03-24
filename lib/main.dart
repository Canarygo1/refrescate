import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:refrescate/data/HttpRemoteRepository.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/ui/component/splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/cubit/cart_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _storage = FlutterSecureStorage();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RemoteRepository remoteRepository = HttpRemoteRepository(Client());
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider(
            create: ((context) => CartCubit(remoteRepository)),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: SplashScreen(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashScreen();
      },
    );
  }

}


