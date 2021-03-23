import 'package:refrescate/model/Cut.dart';

import 'Producto.dart';
import 'cart.dart';

/// Id : "6698a92f-45c8-4760-a5cb-9c7dc9555193"
/// Cantidad : 2
/// CarritosItemId : "e0203021-a5bc-4b12-afec-f5db3f286821"
/// CarritosItemProductoId : "5172c0f6-6f35-4483-81a8-6d601e9abb68"
/// Producto : {"Id":"5172c0f6-6f35-4483-81a8-6d601e9abb68","Nombre":"Pollo para asar","Color":"Black","Descripcion":"Polllo ideal para asar, con un sabor y una textura unicos","Precio":3.2,"CantidadLote":1,"Descuento":0,"UrlImagenes":["1","2","3"],"TipoUnidad":"Unidades","NegocioProductoId":"5665eeb1-52d8-48d5-8aea-caa330af9723","CaracteristicasProductoId":null,"CategoriaProductoId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab"}

class CarritosItems {
  String _id;
  int _cantidad;
  String _carritosItemId;
  String _carritosItemProductoId;
  Producto _producto;
  String _peso;
  Cut _cut;
  String get id => _id;
  String get peso => _peso;
  int get cantidad => _cantidad;
  String get carritosItemId => _carritosItemId;
  String get carritosItemProductoId => _carritosItemProductoId;
  Producto get producto => _producto;
  Cut get cut => _cut;

  CarritosItems({
    String id,
    int cantidad,
    String carritosItemId,
    String carritosItemProductoId,
    Producto producto,
    String peso,Cut cut}){
    _id = id;
    _cantidad = cantidad;
    _carritosItemId = carritosItemId;
    _carritosItemProductoId = carritosItemProductoId;
    _producto = producto;
    _cut = cut;
  }

  CarritosItems.fromJson(dynamic json) {
    _id = json["Id"];
    _cantidad = json["Cantidad"];
    _carritosItemId = json["CarritosItemId"];
    _carritosItemProductoId = json["CarritosItemProductoId"];
    _producto = json["Producto"] != null ? Producto.fromJson(json["Producto"]) : null;
    _peso = json["Peso"] != null ? json["Peso"] : null;
    _cut = json["corte"] != null? Cut.fromJson(json["corte"]):null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Cantidad"] = _cantidad;
    map["CarritosItemId"] = _carritosItemId;
    map["CarritosItemProductoId"] = _carritosItemProductoId;
    if (_producto != null) {
      map["Producto"] = _producto.toJson();
    }
    if (_cut != null) {
      map["corte"] = _cut.toJson();
    }
    if (_peso != null) {
      map["Peso"] = _peso;
    }
    return map;
  }

}