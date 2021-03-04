/// Id : "bba854a7-5372-4f85-a27a-332dbc47f5ad"
/// Estado : "En preparacion"
/// FechaEntrega : "2021-02-24"
/// PrecioTotal : 21.9
/// createdAt : "2021-02-25T10:27:18.673Z"
/// updatedAt : "2021-02-25T10:27:18.673Z"
/// PedidoCarritoId : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// PedidoUsuarioId : "4ad8d937-52a4-4f43-a435-bfad4a879e5a"
/// PedidoNegocioId : "5665eeb1-52d8-48d5-8aea-caa330af9723"
/// Carritos : {"Id":"e0203021-a5bc-4b12-afec-f5db3f286821","PrecioTotal":null,"Pagado":false,"Estado":"Pedido realizado","UsuarioCarritoId":"4ad8d937-52a4-4f43-a435-bfad4a879e5a","CarritosItems":[{"Id":"6698a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"PesoFinal":null,"PrecioFinal":null,"Confirmado":false,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}}]}

class Order {
  String _id;
  String _estado;
  String _fechaEntrega;
  double _precioTotal;
  String _createdAt;
  String _updatedAt;
  String _pedidoCarritoId;
  String _pedidoUsuarioId;
  String _pedidoNegocioId;
  Carritos _carritos;

  String get id => _id;
  String get estado => _estado;
  String get fechaEntrega => _fechaEntrega;
  double get precioTotal => _precioTotal;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get pedidoCarritoId => _pedidoCarritoId;
  String get pedidoUsuarioId => _pedidoUsuarioId;
  String get pedidoNegocioId => _pedidoNegocioId;
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
      String pedidoNegocioId, 
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
    if(json["PrecioTotal"]is int){
      _precioTotal = json["PrecioTotal"].toDouble();

    }else {
      _precioTotal = json["PrecioTotal"];

    }
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
/// CarritosItems : [{"Id":"6698a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"PesoFinal":null,"PrecioFinal":null,"Confirmado":false,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}}]

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

/// Id : "6698a92f-45c8-4760-a5cb-9c7dc9555193"
/// Cantidad : 2
/// PesoFinal : null
/// PrecioFinal : null
/// Confirmado : false
/// CarritosItemId : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// CarritosItemProductoId : "5172c0f6-6f35-4483-81a8-6d601e9abb68"
/// Producto : {"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}

class CarritosItems {
  String _id;
  int _cantidad;
  dynamic _pesoFinal;
  dynamic _precioFinal;
  bool _confirmado;
  String _carritosItemId;
  String _carritosItemProductoId;
  Producto _producto;

  String get id => _id;
  int get cantidad => _cantidad;
  dynamic get pesoFinal => _pesoFinal;
  dynamic get precioFinal => _precioFinal;
  bool get confirmado => _confirmado;
  String get carritosItemId => _carritosItemId;
  String get carritosItemProductoId => _carritosItemProductoId;
  Producto get producto => _producto;

  CarritosItems({
      String id, 
      int cantidad, 
      dynamic pesoFinal, 
      dynamic precioFinal, 
      bool confirmado, 
      String carritosItemId, 
      String carritosItemProductoId, 
      Producto producto}){
    _id = id;
    _cantidad = cantidad;
    _pesoFinal = pesoFinal;
    _precioFinal = precioFinal;
    _confirmado = confirmado;
    _carritosItemId = carritosItemId;
    _carritosItemProductoId = carritosItemProductoId;
    _producto = producto;
}

  CarritosItems.fromJson(dynamic json) {
    _id = json["Id"];
    _cantidad = json["Cantidad"];
    _pesoFinal = json["PesoFinal"];
    _precioFinal = json["PrecioFinal"];
    _confirmado = json["Confirmado"];
    _carritosItemId = json["CarritosItemId"];
    _carritosItemProductoId = json["CarritosItemProductoId"];
    _producto = json["Producto"] != null ? Producto.fromJson(json["Producto"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Cantidad"] = _cantidad;
    map["PesoFinal"] = _pesoFinal;
    map["PrecioFinal"] = _precioFinal;
    map["Confirmado"] = _confirmado;
    map["CarritosItemId"] = _carritosItemId;
    map["CarritosItemProductoId"] = _carritosItemProductoId;
    if (_producto != null) {
      map["Producto"] = _producto.toJson();
    }
    return map;
  }

}

/// Id : "5172c0f6-6f35-4483-81a8-6d601e9abb68"
/// Nombre : "Pollo para asar"
/// Color : "Black"
/// Descripcion : "Polllo ideal para asar, con un sabor y una textura unicos"
/// Precio : 3.2
/// CantidadLote : 1
/// Descuento : 0
/// UrlImagenes : ["1","2","3"]
/// TipoUnidad : "Unidades"
/// NegocioProductoId : "5665eeb1-52d8-48d5-8aea-caa330af9723"
/// CaracteristicasProductoId : null
/// CategoriaProductoId : "e2fd8288-ee50-47c1-a804-f1241c9f9aab"

class Producto {
  String _id;
  String _nombre;
  String _color;
  String _descripcion;
  double _precio;
  int _cantidadLote;
  int _descuento;
  List<String> _urlImagenes;
  String _tipoUnidad;
  String _negocioProductoId;
  dynamic _caracteristicasProductoId;
  String _categoriaProductoId;

  String get id => _id;
  String get nombre => _nombre;
  String get color => _color;
  String get descripcion => _descripcion;
  double get precio => _precio;
  int get cantidadLote => _cantidadLote;
  int get descuento => _descuento;
  List<String> get urlImagenes => _urlImagenes;
  String get tipoUnidad => _tipoUnidad;
  String get negocioProductoId => _negocioProductoId;
  dynamic get caracteristicasProductoId => _caracteristicasProductoId;
  String get categoriaProductoId => _categoriaProductoId;

  Producto({
      String id, 
      String nombre, 
      String color, 
      String descripcion, 
      double precio, 
      int cantidadLote, 
      int descuento, 
      List<String> urlImagenes, 
      String tipoUnidad, 
      String negocioProductoId, 
      dynamic caracteristicasProductoId, 
      String categoriaProductoId}){
    _id = id;
    _nombre = nombre;
    _color = color;
    _descripcion = descripcion;
    _precio = precio;
    _cantidadLote = cantidadLote;
    _descuento = descuento;
    _urlImagenes = urlImagenes;
    _tipoUnidad = tipoUnidad;
    _negocioProductoId = negocioProductoId;
    _caracteristicasProductoId = caracteristicasProductoId;
    _categoriaProductoId = categoriaProductoId;
}

  Producto.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _color = json["Color"];
    _descripcion = json["Descripcion"];
    _precio = json["Precio"];
    _cantidadLote = json["CantidadLote"];
    _descuento = json["Descuento"];
    _urlImagenes = json["UrlImagenes"] != null ? json["UrlImagenes"].cast<String>() : [];
    _tipoUnidad = json["TipoUnidad"];
    _negocioProductoId = json["NegocioProductoId"];
    _caracteristicasProductoId = json["CaracteristicasProductoId"];
    _categoriaProductoId = json["CategoriaProductoId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["Color"] = _color;
    map["Descripcion"] = _descripcion;
    map["Precio"] = _precio;
    map["CantidadLote"] = _cantidadLote;
    map["Descuento"] = _descuento;
    map["UrlImagenes"] = _urlImagenes;
    map["TipoUnidad"] = _tipoUnidad;
    map["NegocioProductoId"] = _negocioProductoId;
    map["CaracteristicasProductoId"] = _caracteristicasProductoId;
    map["CategoriaProductoId"] = _categoriaProductoId;
    return map;
  }

}