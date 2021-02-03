import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';

class OrderPresenter{
  OrderView _view;
  RemoteRepository _remoteRepository;

  OrderPresenter(this._view, this._remoteRepository);

  init() async {
    try{
      String userId = "079a48bb-b836-40d7-b11d-5711354fc843";
      List<Order> query = await _remoteRepository.getOrders(userId);


    }catch(e){

    }

  }
}
abstract class OrderView{

}
