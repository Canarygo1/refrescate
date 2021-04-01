import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/cart.dart';

class ProductInfoPresenter {
  ProductInfoView _view;
  RemoteRepository _remoteRepository;
  CartCubit _cartCubit;
  final _storage = FlutterSecureStorage();

  ProductInfoPresenter(this._view, this._remoteRepository, this._cartCubit);

  addProductToCart(String productId, String unit, String observations, {String cutId}) async {
    String userId = await _storage.read(key: "userId");
    print(observations);
    _cartCubit.addItemCart(userId, unit, productId, observations,cutId: cutId);
  }

  updateProductObservations(String cartItemId, String observations) async {
    String userId = await _storage.read(key: "userId");
    _cartCubit.updateItemCartObservations(userId, cartItemId, observations);
  }

  updateProductCart(String cartItemId, String unit, int quantity, String weight,String observations,
      {String cutId}) async {
    String userId = await _storage.read(key: "userId");

    _cartCubit.updateItemCart(userId, unit ,cartItemId, weight, quantity,observations,
        cutId: cutId);
  }

  deleteProductCart(String cartItemId) async {
    String userId = await _storage.read(key: "userId");
    _cartCubit.deleteItemCart(userId, cartItemId);
  }

  initialQuantity(Cart cart, String productId) {
    for (int i = 0; i < cart.carritosItems.length; i++) {
      if (productId == cart.carritosItems[i].id) {
        _view.setInitialQuantity(
            cart.carritosItems[i].cantidad.toString() + " Unidades");
      }
    }
  }
}

abstract class ProductInfoView {
  productQuantityUpdated(int quantity);

  productQuantityError();

  setInitialQuantity(String initialQuantity);
}
