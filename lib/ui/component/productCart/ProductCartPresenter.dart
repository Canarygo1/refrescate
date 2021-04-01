import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/PaymentData.dart';
import 'package:refrescate/model/cart.dart';

class ProductCartPresenter {
  ProductCartView _view;
  CartCubit _cartCubit;
  ProductCartPresenter(this._view, this._cartCubit);
  final _storage = FlutterSecureStorage();

  calculateFinalPrice(Cart cart)  {

    try {
      double _finalPrice = 0;
      for (int i = 0; i < cart.carritosItems.length; i++) {
        double extra = 0;
        if(cart.carritosItems[i].cut != null){
          extra = double.parse(cart.carritosItems[i].cut.aumento);
        }
        if(cart.carritosItems[i].cantidad == null){
          _finalPrice = _finalPrice+(cart.carritosItems[i].producto.precio + extra)*double.parse(cart.carritosItems[i].peso);

        }else{
          _finalPrice = _finalPrice+(cart.carritosItems[i].producto.precio + extra)*cart.carritosItems[i].cantidad;

        }
      }
      _view.setFinalPrice(_finalPrice);
    } catch (e) {
      print(e);
    }
  }

  createOrder(String precioTotal, DateTime fechaEntrega) async {
    String userId = await _storage.read(key: "userId");
    String fechaEntregaParse = fechaEntrega.toString().split(" ")[0];
    PaymentData paymentData = await _cartCubit.createOrder(userId, fechaEntregaParse, double.parse(
        precioTotal));
    _view.changeOrderStatus(paymentData);
  }
}

abstract class ProductCartView {
  setFinalPrice(double finalPrice);
  changeOrderStatus(PaymentData paymentData);
}
