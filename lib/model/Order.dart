import 'CarritosItems.dart';

/// Id : "d0c980a8-b484-4a8f-8a2d-4c0e70677dc7"
/// Estado : "En preparacion"
/// FechaEntrega : "2021-02-28"
/// PrecioTotal : 22.9
/// createdAt : "2021-02-22T11:36:37.727Z"
/// updatedAt : "2021-02-22T11:36:37.727Z"
/// PedidoCarritoId : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// PedidoUsuarioId : "4ad8d937-52a4-4f43-a435-bfad4a879e5a"
/// PedidoNegocioId : null
/// Carritos : {"Id":"e0203021-a5bc-4b12-afec-f5db3f286821","PrecioTotal":null,"Pagado":false,"Estado":"Pedido realizado","UsuarioCarritoId":"4ad8d937-52a4-4f43-a435-bfad4a879e5a","CarritosItems":[{"Id":"6698a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}}]}

class Order {
  String _id;
  String _estado;
  String _fechaEntrega;
  double _precioTotal;
  String _createdAt;
  String _updatedAt;
  String _pedidoCarritoId;
  String _pedidoUsuarioId;
  dynamic _pedidoNegocioId;
  Carritos _carritos;

  String get id => _id;
  String get estado => _estado;
  String get fechaEntrega => _fechaEntrega;
  double get precioTotal => _precioTotal;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get pedidoCarritoId => _pedidoCarritoId;
  String get pedidoUsuarioId => _pedidoUsuarioId;
  dynamic get pedidoNegocioId => _pedidoNegocioId;
  Carritos get carritos => _carritos;

  Order({
      String id, 
      String estado, 
      String fechaEntrega, 
      double precioTotal, 
      String createdAt, 
      String updatedAt, 
      String pedidoCarritoId, 
      String pedidoUsuarioId, 
      dynamic pedidoNegocioId, 
      Carritos carritos}){
    _id = id;
    _estado = estado;
    _fechaEntrega = fechaEntrega;
    _precioTotal = precioTotal;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pedidoCarritoId = pedidoCarritoId;
    _pedidoUsuarioId = pedidoUsuarioId;
    _pedidoNegocioId = pedidoNegocioId;
    _carritos = carritos;
}

  Order.fromJson(dynamic json) {
    _id = json["Id"];
    _estado = json["Estado"];
    _fechaEntrega = json["FechaEntrega"];
    _precioTotal = json["PrecioTotal"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _pedidoCarritoId = json["PedidoCarritoId"];
    _pedidoUsuarioId = json["PedidoUsuarioId"];
    _pedidoNegocioId = json["PedidoNegocioId"];
    _carritos = json["Carritos"] != null ? Carritos.fromJson(json["Carritos"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Estado"] = _estado;
    map["FechaEntrega"] = _fechaEntrega;
    map["PrecioTotal"] = _precioTotal;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["PedidoCarritoId"] = _pedidoCarritoId;
    map["PedidoUsuarioId"] = _pedidoUsuarioId;
    map["PedidoNegocioId"] = _pedidoNegocioId;
    if (_carritos != null) {
      map["Carritos"] = _carritos.toJson();
    }
    return map;
  }

}

/// Id : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// PrecioTotal : null
/// Pagado : false
/// Estado : "Pedido realizado"
/// UsuarioCarritoId : "4ad8d937-52a4-4f43-a435-bfad4a879e5a"
/// CarritosItems : [{"Id":"6698a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}}]

class Carritos {
  String _id;
  dynamic _precioTotal;
  bool _pagado;
  String _estado;
  String _usuarioCarritoId;
  List<CarritosItems> _carritosItems;

  String get id => _id;
  dynamic get precioTotal => _precioTotal;
  bool get pagado => _pagado;
  String get estado => _estado;
  String get usuarioCarritoId => _usuarioCarritoId;
  List<CarritosItems> get carritosItems => _carritosItems;

  Carritos({
      String id, 
      dynamic precioTotal, 
      bool pagado, 
      String estado, 
      String usuarioCarritoId, 
      List<CarritosItems> carritosItems}){
    _id = id;
    _precioTotal = precioTotal;
    _pagado = pagado;
    _estado = estado;
    _usuarioCarritoId = usuarioCarritoId;
    _carritosItems = carritosItems;
}

  Carritos.fromJson(dynamic json) {
    _id = json["Id"];
    _precioTotal = json["PrecioTotal"];
    _pagado = json["Pagado"];
    _estado = json["Estado"];
    _usuarioCarritoId = json["UsuarioCarritoId"];
    if (json["CarritosItems"] != null) {
      _carritosItems = [];
      json["CarritosItems"].forEach((v) {
        _carritosItems.add(CarritosItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["PrecioTotal"] = _precioTotal;
    map["Pagado"] = _pagado;
    map["Estado"] = _estado;
    map["UsuarioCarritoId"] = _usuarioCarritoId;
    if (_carritosItems != null) {
      map["CarritosItems"] = _carritosItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

