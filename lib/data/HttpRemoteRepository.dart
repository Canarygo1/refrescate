import 'dart:convert';

import 'package:http/http.dart';
import 'package:refrescate/model/Order.dart';
import 'RemoteRepository.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;
  final String endpoint = "http://localhost:3500/";

  HttpRemoteRepository(this._client);

  @override
  Future<List<Order>> getOrders(String userId) async {
    var uri = Uri.parse(endpoint + "user/" + userId + "/orders");
    var response = await _client.get(uri);
    List<dynamic> data = json.decode(response.body)['result'];
    List<Order> orders = [];
    print(data);

    for (var i = 0; i < data.length; i++) {
      Order order = Order.fromJson(data[i]);
      orders.add(order);
    }
    return orders;
  }
}
