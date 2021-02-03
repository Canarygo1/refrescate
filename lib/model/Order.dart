import 'package:refrescate/model/Cart.dart';

/// Id : "c07f8f68-9631-4b51-a3b5-20d44c0f13ea"
/// Estado : "En preparacion"
/// FechaEntrega : "2020-09-28"
/// PedidoCarritoId : "454e72c1-6bff-402b-9977-1a63deb47f5c"
/// PedidoUsuarioId : "079a48bb-b836-40d7-b11d-5711354fc843"
/// Carritos : {"Id":"454e72c1-6bff-402b-9977-1a63deb47f5c","PrecioTotal":null,"Pagado":false,"Estado":"Pedido realizado","UsuarioCarritoId":"079a48bb-b836-40d7-b11d-5711354fc843"}

class Order {
  String _id;
  String _estado;
  String _fechaEntrega;
  String _pedidoCarritoId;
  String _pedidoUsuarioId;
  Cart _cart;

  String get id => _id;
  String get estado => _estado;
  String get fechaEntrega => _fechaEntrega;
  String get pedidoCarritoId => _pedidoCarritoId;
  String get pedidoUsuarioId => _pedidoUsuarioId;
  Cart get carritos => _cart;

  Order({
      String id,
      String estado,
      String fechaEntrega,
      String pedidoCarritoId,
      String pedidoUsuarioId,
      Cart cart}){
    _id = id;
    _estado = estado;
    _fechaEntrega = fechaEntrega;
    _pedidoCarritoId = pedidoCarritoId;
    _pedidoUsuarioId = pedidoUsuarioId;
    _cart = cart;
}

  Order.fromJson(dynamic json) {
    _id = json["Id"];
    _estado = json["Estado"];
    _fechaEntrega = json["FechaEntrega"];
    _pedidoCarritoId = json["PedidoCarritoId"];
    _pedidoUsuarioId = json["PedidoUsuarioId"];
    _cart = json["Carritos"] != null ? Cart.fromJson(json["Carritos"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Estado"] = _estado;
    map["FechaEntrega"] = _fechaEntrega;
    map["PedidoCarritoId"] = _pedidoCarritoId;
    map["PedidoUsuarioId"] = _pedidoUsuarioId;
    if (_cart != null) {
      map["Carritos"] = _cart.toJson();
    }
    return map;
  }

}

