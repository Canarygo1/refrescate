import 'dart:convert';

import 'package:http/http.dart';
import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/cart.dart';
import 'RemoteRepository.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;
  final String endpoint = "http://163.172.183.16:31469/";

  HttpRemoteRepository(this._client);

  @override
  Future<List<Product>> getProducts(String businessId) async {
    var uri = Uri.parse(endpoint + "business/" + businessId + "/products");
    var response = await _client.get(uri);
    List<dynamic> data = json.decode(response.body)['result']["Productos"];
    List<Product> products = [];
    for (var i = 0; i < data.length; i++) {
      Product product = Product.fromJson(data[i]);
      products.add(product);
    }
    return products;
  }

  @override
  Future<Cart> getActiveCart(String userId) async {
    var uri = Uri.parse(endpoint + "user/" + userId + "/cart");
    var response = await _client.get(uri);
    Map<String, dynamic> data = json.decode(response.body)['result'][0];
    Cart cart = Cart.fromJson(data);
    return cart;
  }

  @override
  Future<bool> addItemCart(String userId, String cartId,
      String productId) async {
    // TODO: implement addItemCart
    var uri =
    Uri.parse(endpoint + "user/" + userId + "/cart/" + cartId + "/items");
    var body = jsonEncode({'Cantidad': 1, 'CarritosItemProductoId': productId});
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }

  @override
  Future<bool> deleteCartItem(String userId, String cartId,
      String cartItemId) async {
    var uri = Uri.parse(endpoint +
        "user/" +
        userId +
        "/cart/" +
        cartId +
        "/items/" +
        cartItemId);
    var response = await _client.delete(uri);
    return true;
  }

  @override
  Future<bool> updateCartItemQuantity(String userId, String cartId,
      String cartItemId, int quantity) async {
//user/:userId/cart/:cartId/items/:itemId
    var uri = Uri.parse(endpoint +
        "user/" +
        userId +
        "/cart/" +
        cartId +
        "/items/" +
        cartItemId);
    var body = jsonEncode({"Cantidad": quantity});

    var response = await _client.put(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }

  @override
  Future<List<Order>> getOrders(String userId) async {
    var uri = Uri.parse(endpoint + "user/" + userId + "/orders");
    var response = await _client.get(uri);
    List<dynamic> data = json.decode(response.body)['result'];
    List<Order> orders = [];

    for (int i = 0; i < data.length; i++) {
      Order order = Order.fromJson(data[i]);
      orders.add(order);
    }
    return orders;
  }

  @override
  Future<bool> createOrder(String userId, String fechaEntrega,
      String businessId, double precioTotal) async{
    var uri =
    Uri.parse(endpoint + "user/" + userId + "/orders");
    var body = jsonEncode({'PedidoNegocioId': businessId, 'FechaEntrega': fechaEntrega, 'PrecioTotal':precioTotal});
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    print(response.body);

    return true;
  }

  @override
  Future<bool> createCart(String userId) async{
    var uri =
    Uri.parse(endpoint + "user/" + userId + "/cart");
    var body = jsonEncode({'UsuarioCarritoId': userId});
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    return true;
  }
}
