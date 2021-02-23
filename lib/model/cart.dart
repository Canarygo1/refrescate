import 'CarritosItems.dart';
import 'Usuario.dart';

/// Id : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// PrecioTotal : null
/// Pagado : false
/// Estado : "En proceso"
/// UsuarioCarritoId : "4ad8d937-52a4-4f43-a435-bfad4a879e5a"
/// Usuario : {"Id":"4ad8d937-52a4-4f43-a435-bfad4a879e5a","Nombre":"Alejandro","Apellidos":"Cruz","Email":"1@gmail.com","Telefono":"607977602","Direccion":"C/ La petanca 34, 38530","CodigoPostal":"38530","NegocioUsuarioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}
/// CarritosItems : [{"Id":"6698a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}},{"Id":"1111a92f-45c8-4760-a5cb-9c7dc9555193","Cantidad":2,"CarritosItemId":"e0203021-a5bc-4b12-afec-f5db3f286821","CarritosItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Producto":{"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}}]

class Cart {
  String _id;
  dynamic _precioTotal;
  bool _pagado;
  String _estado;
  String _usuarioCarritoId;
  Usuario _usuario;
  List<CarritosItems> _carritosItems;

  String get id => _id;
  dynamic get precioTotal => _precioTotal;
  bool get pagado => _pagado;
  String get estado => _estado;
  String get usuarioCarritoId => _usuarioCarritoId;
  Usuario get usuario => _usuario;
  List<CarritosItems> get carritosItems => _carritosItems;

  Cart({
      String id, 
      dynamic precioTotal, 
      bool pagado, 
      String estado, 
      String usuarioCarritoId, 
      Usuario usuario, 
      List<CarritosItems> carritosItems}){
    _id = id;
    _precioTotal = precioTotal;
    _pagado = pagado;
    _estado = estado;
    _usuarioCarritoId = usuarioCarritoId;
    _usuario = usuario;
    _carritosItems = carritosItems;
}

  Cart.fromJson(dynamic json) {
    _id = json["Id"];
    _precioTotal = json["PrecioTotal"];
    _pagado = json["Pagado"];
    _estado = json["Estado"];
    _usuarioCarritoId = json["UsuarioCarritoId"];
    _usuario = json["Usuario"] != null ? Usuario.fromJson(json["Usuario"]) : null;
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
    if (_usuario != null) {
      map["Usuario"] = _usuario.toJson();
    }
    if (_carritosItems != null) {
      map["CarritosItems"] = _carritosItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}




