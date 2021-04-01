import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';

class OrderPresenter{
  OrderView _view;
  RemoteRepository _remoteRepository;
  final _storage = FlutterSecureStorage();

  OrderPresenter(this._view, this._remoteRepository);

  init() async {
    try{
      String userId = await _storage.read(key: "userId");
      print(userId);
      List<Order> orders = await _remoteRepository.getOrders(userId);
      _view.setOrders(orders);
    }catch(e){
      print(e);
    }
  }
}
abstract class OrderView{
  setOrders(List<Order> newOrders);
}