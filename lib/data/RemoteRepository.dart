import 'package:refrescate/model/Order.dart';

abstract class RemoteRepository{

  Future<List<Order>> getOrders(String userId);

}
