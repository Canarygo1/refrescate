import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/PaymentData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  final PaymentData paymentData;

  const PaymentScreen({Key key, this.paymentData}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {
    @override
    CartCubit cartCubit;
    final _storage = FlutterSecureStorage();

    void initState() {
       cartCubit = context.read<CartCubit>();

      // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new WebviewScaffold(
        withJavascript: true,
        appCacheEnabled: true,
        url:
            new Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
        appBar: new AppBar(
          title: new Text("Widget webview"),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() async {
    String userId = await _storage.read(key: "userId");

    cartCubit.getCart(userId);
    Navigator.of(context).pop(true);
  }
    String _loadHTML() {
    return r'''
      <html>
        <body>
<form name="from" id="yourform" action="'''+widget.paymentData.url+ r'''" method="POST">
  <input type="hidden" name="Ds_SignatureVersion" value="HMAC_SHA256_V1"/>
  <input type="hidden" name="Ds_MerchantParameters"
         value="'''+ widget.paymentData.body.dsMerchantParameters+r'''"/>
  <input type="hidden" name="Ds_Signature" value="'''+widget.paymentData.body.dsSignature+r'''"/>
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
