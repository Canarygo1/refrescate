import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';

class OrderPresenter{
  OrderView _view;
  RemoteRepository _remoteRepository;

  OrderPresenter(this._view, this._remoteRepository);

  init() async {
    try{
      String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";

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
