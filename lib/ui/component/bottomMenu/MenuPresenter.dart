import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refre\scate/data/local/LocalRepository.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/ui/component/bottomMenu/Menu.dart';

class MenuPresenter{
  MenuView _view;
  // RemoteRepository _remoteRepository;
  // LocalRepository _localRepository;
  CartCubit _cartCubit;
  MenuPresenter(this._view, this._cartCubit);
  final _storage = FlutterSecureStorage();

  getActiveCart() async {
    String userId = await _storage.read(key: "userId");
    print(userId);
    _cartCubit.getCart(userId);


    // Cart cart = await _remoteRepository.getActiveCart(userId);
    // int insertStatus = await _localRepository.insertCart(cart);
  }
}
abstract class MenuView{
}
