import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/PaymentData.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/UserRegister.dart';
import 'package:refrescate/model/Usuario.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/model/category.dart';
import 'package:refrescate/model/errors/CustomErrors.dart';
import 'RemoteRepository.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;
  final String endpoint = "http://163.172.183.16:31469/";
  final _storage = FlutterSecureStorage();

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
  Future<bool> addItemCart(String userId, String cartId, String productId,String observations,
      {String cutId}) async {
    print(observations);
    var uri =
        Uri.parse(endpoint + "user/" + userId + "/cart/" + cartId + "/items");
    var body;

    if (cutId != null) {
      body = jsonEncode({
        'Cantidad': 1,
        'Observaciones':observations,
        'CarritosItemProductoId': productId,
        "CarritosCorteId": cutId
      });
    } else {
      body = jsonEncode({'Cantidad': 1,         'Observaciones':observations,
        'CarritosItemProductoId': productId});
    }

    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }

  @override
  Future<bool> addItemCartWeight(String userId, String cartId, String productId,String observations,
      {String cutId}) async {
    print(observations);
    var uri =
        Uri.parse(endpoint + "user/" + userId + "/cart/" + cartId + "/items");
    var body;

    if (cutId != null) {
      body = jsonEncode({
        'Peso': 0.250,
        'CarritosItemProductoId': productId,
        "CarritosCorteId": cutId,
        "Observaciones":observations
      });
    } else {
      body = jsonEncode({'Peso': 0.250,"Observaciones":observations,
        'CarritosItemProductoId': productId});
    }

    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }

  @override
  Future<bool> deleteCartItem(
      String userId, String cartId, String cartItemId) async {
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
  Future<bool> updateCartItemQuantity(
      String userId, String cartId, String cartItemId, int quantity,String obervations,
      {String cutId}) async {
//user/:userId/cart/:cartId/items/:itemId
    var uri = Uri.parse(endpoint +
        "user/" +
        userId +
        "/cart/" +
        cartId +
        "/items/" +
        cartItemId);
    var body;
    if (cutId != null) {
      body = jsonEncode({"Cantidad": quantity, "CarritosCorteId": cutId, "Observaciones":obervations},);
    } else {
      body = jsonEncode({"Cantidad": quantity, "Observaciones":obervations});
    }

    var response = await _client.put(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }

  @override
  Future<bool> updateCartItemWeight(
      String userId, String cartId, String cartItemId, String weight,
      {String cutId}) async {
//user/:userId/cart/:cartId/items/:itemId
    weight = (double.parse(weight)).toString();

    var uri = Uri.parse(endpoint +
        "user/" +
        userId +
        "/cart/" +
        cartId +
        "/items/" +
        cartItemId);
    var body;
    if (cutId != null) {
      body = jsonEncode({"Peso": weight, "CarritosCorteId": cutId});
    } else {
      body = jsonEncode({"Peso": weight});
    }

    var response = await _client.put(uri,
        headers: {"Content-Type": "application/json"}, body: body);

    return true;
  }
  @override
  Future<bool> updateCartItemObservations(String userId, String cartId,String cartItemId, String observations) async {
    var uri = Uri.parse(endpoint +
        "user/" +
        userId +
        "/cart/" +
        cartId +
        "/items/" +
        cartItemId);
    var body;
    body = jsonEncode({"Observaciones": observations});
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
    print("Tamaño" + orders.length.toString());

    return orders;
  }

  @override
  Future<PaymentData> createOrder(String userId, String fechaEntrega,
      String businessId, double precioTotal) async {
    var uri = Uri.parse(endpoint + "user/" + userId + "/orders");
    var body = jsonEncode({
      'PedidoNegocioId': businessId,
      'FechaEntrega': fechaEntrega,
      'PrecioTotal': double.parse(precioTotal.toStringAsFixed(2))
    });
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(response.body)['result'];
    PaymentData paymentData = PaymentData.fromJson(data["paymentData"]);
    return paymentData;
  }

  @override
  Future<bool> createCart(String userId) async {
    var uri = Uri.parse(endpoint + "user/" + userId + "/cart");
    var body = jsonEncode({'UsuarioCarritoId': userId});
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    return true;
  }

  @override
  Future<List<Category>> getCategories(String businessId) async {
    var uri = Uri.parse(endpoint + "business/" + businessId + "/categories");
    var response = await _client.get(uri);
    print(response.body);
    List<dynamic> data = json.decode(response.body)['result']['Categorias'];
    List<Category> categories = [];

    for (int i = 0; i < data.length; i++) {
      Category category = Category.fromJson(data[i]);
      categories.add(category);
    }
    return categories;
  }

  @override
  Future<bool> login(String email, String password) async {
    var uri = Uri.parse(endpoint + "login");
    var body = jsonEncode({'Email': email, 'Password': password});
    var response = await _client.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(response.body);
    if (data["code"] != 200) {
      return false;
    }
    await storeToken(data["result"]["RefreshToken"], data["result"]["AccessToken"],
        data["result"]["Id"]);
    return true;
  }

  @override
  Future<bool> deleteToken() {
    throw UnimplementedError();
  }

  @override
  Future<bool> storeToken(
      String refreshToken, String accessToken, String userId) async {
    await _storage.write(key: "accessToken", value: accessToken);
    await _storage.write(key: "refreshToken", value: refreshToken);
    await _storage.write(key: "userId", value: userId);
    return true;
  }

  @override
  Future<bool> updateAccessToken(String refreshToken) async {
    var uriUpdate = Uri.parse(endpoint + "token");
    var bodyToken = jsonEncode({'RefreshToken':refreshToken});
    var responseToken = await _client.post(uriUpdate,
        headers: {"Content-Type": "application/json"},body:bodyToken);
    var dataToken = json.decode(responseToken.body);
    var accessTokenUpdate  = dataToken["result"]["AccessToken"];

    await updateAccessTokenStorage(accessTokenUpdate);
    return true;
  }

  @override
  Future<bool> updateAccessTokenStorage(String accessToken) async {
    await _storage.write(key: "accessToken", value: accessToken);
    return true;
  }

  Future<bool> logOut() async {
    await _storage.deleteAll();
    return true;
  }

  @override
  Future<Usuario> getUser(String userId) async {
    var uri = Uri.parse(endpoint + "user/"+userId);
    Usuario user;
    var accessToken  = await getUserAccessToken();
    var response = await _client.get(uri,
        headers: {"Content-Type": "application/json","token":accessToken});
    var data = json.decode(response.body);

    if(data['code'] == 401 && data['result'] == "jwt expired"){
      throw JwtExpiredError("jwt expired");
    }
    else{
      user = Usuario.fromJson(data["result"]["Usuario"][0]);
      return user;
    }
    return user;
  }

  Future<String> getUserAccessToken() async {
    return await _storage.read(key: "accessToken");
  }
  Future<String> getUserRefreshToken() async {
    return await _storage.read(key: "refreshToken");
  }

  @override
  Future<bool> userCreation(UserRegister userRegister) async {
    print("TU PRIMOO");
    String negocioId ='5665eeb1-52d8-48d5-8aea-caa330af9723';
    var uriUpdate = Uri.parse(endpoint + "register");
    var body = jsonEncode(
        {'Email':userRegister.email,
          'Password':userRegister.password,
          'NegocioAuthUsuarioId':negocioId
        });

    var responseToken = await _client.post(uriUpdate,
        headers: {"Content-Type": "application/json"},body:body);
    var dataToken = json.decode(responseToken.body);
    print(dataToken["result"]);
    var authId  = dataToken["result"];
    print(authId);
    var uriUpdateUser = Uri.parse(endpoint + "user");
    var bodyUser = jsonEncode(
        { 'Id':authId,
          'Email':userRegister.email,
          'Nombre':userRegister.name,
          'Apellidos':userRegister.surname,
          'Telefono':userRegister.phoneNumber,
          'Direccion':userRegister.address,
          'CodigoPostal':'38530',
          'NegocioUsuarioId':negocioId
        });
    var responseUser = await _client.post(uriUpdateUser,
        headers: {"Content-Type": "application/json"},body:bodyUser);
    var dataUser = json.decode(responseUser.body);
    print(dataUser);
    if(dataUser['code'] == 200 ){
      return true;
  }else{
      return false;
    }
  }


}
