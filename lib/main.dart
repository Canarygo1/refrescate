import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
      create: ((context) => CartCubit(remoteRepository)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new WebviewScaffold(

          withJavascript: true,
          appCacheEnabled: true,
          url: new Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
        ),
      ),
    );
  }

  String _loadHTML() {
    return r'''
      <html>
        <body>
            <form name="from" id="yourform"
 action="https://sis-t.redsys.es:25443/sis/realizarPago" method="POST">
              <input type="hidden" name="Ds_SignatureVersion" value="HMAC_SHA256_V1"/>
              <input type="hidden" name="Ds_MerchantParameters" value="eyJEU19NRVJDSEFOVF9BTU9VTlQiOiI1NDk5IiwiRFNfTUVSQ0hBTlRfQ1VSUkVOQ1kiOiI5NzgiLCJEU19NRVJDSEFOVF9PUkRFUiI6MTQ0NjAzMTAsIkRTX01FUkNIQU5UX01FUkNIQU5UTkFNRSI6Ik1JIENPTUVSQ0lPIiwiRFNfTUVSQ0hBTlRfTUVSQ0hBTlRDT0RFIjoiOTk5MDA4ODgxIiwiRFNfTUVSQ0hBTlRfVEVSTUlOQUwiOiIxIiwiRFNfTUVSQ0hBTlRfVFJBTlNBQ1RJT05UWVBFIjoiMSIsIkRTX01FUkNIQU5UX1VSTE9LIjoiaHR0cHM6Ly93d3cucmVzZXJ2YWxvLmFwcCIsIkRTX01FUkNIQU5UX1VSTEtPIjoiaHR0cHM6Ly93d3cucmVzZXJ2YWxvLmFwcC9jYXJ0YXMvZXJ2YXphIn0=z"/>
              <input type="hidden" name="Ds_Signature" value="Df3AboL5GZZhYAX/IzBfIrvq0Fp47BiYmSVzIsHbVsM="/>	
	          </form>
        </body>
      </html>
          <script>
      document.addEventListener("DOMContentLoaded", function (event) {
        document
          .createElement("form")
          .submit.call(document.getElementById("yourform"));
      });
    </script>
    ''';
  }
}
