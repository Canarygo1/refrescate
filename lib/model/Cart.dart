
/// Id : "454e72c1-6bff-402b-9977-1a63deb47f5c"
/// PrecioTotal : null
/// Pagado : false
/// Estado : "Pedido realizado"
/// UsuarioCarritoId : "079a48bb-b836-40d7-b11d-5711354fc843"

class Cart {
  String _id;
  dynamic _precioTotal;
  bool _pagado;
  String _estado;
  String _usuarioCarritoId;

  String get id => _id;
  dynamic get precioTotal => _precioTotal;
  bool get pagado => _pagado;
  String get estado => _estado;
  String get usuarioCarritoId => _usuarioCarritoId;

  Carritos({
    String id,
    dynamic precioTotal,
    bool pagado,
    String estado,
    String usuarioCarritoId}){
    _id = id;
    _precioTotal = precioTotal;
    _pagado = pagado;
    _estado = estado;
    _usuarioCarritoId = usuarioCarritoId;
  }

  Cart.fromJson(dynamic json) {
    _id = json["Id"];
    _precioTotal = json["PrecioTotal"];
    _pagado = json["Pagado"];
    _estado = json["Estado"];
    _usuarioCarritoId = json["UsuarioCarritoId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["PrecioTotal"] = _precioTotal;
    map["Pagado"] = _pagado;
    map["Estado"] = _estado;
    map["UsuarioCarritoId"] = _usuarioCarritoId;
    return map;
  }

}
