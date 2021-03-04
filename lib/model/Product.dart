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
/// categoriaItems : [{"Id":"de65d5f2-b358-4074-b1ef-b36b66e066d6","CategoriasItemProductoId":"5172c0f6-6f35-4483-81a8-6d601e9abb68","CategoriasItemId":"e2fd8288-ee50-47c1-a804-f1241c9f9aab","Categoria":{"Id":"e2fd8288-ee50-47c1-a804-f1241c9f9aab","Nombre":"Pollo","idpadre":null,"CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}}]

class Product {
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
  List<CategoriaItems> _categoriaItems;

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
  List<CategoriaItems> get categoriaItems => _categoriaItems;

  Product({
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
      List<CategoriaItems> categoriaItems}){
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
    _categoriaItems = categoriaItems;
}

  Product.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _color = json["Color"];
    _descripcion = json["Descripcion"];
    if(json["Precio"]is int){
      _precio = json["Precio"].toDouble();

    }else {
      _precio = json["Precio"];

    }
    _cantidadLote = json["CantidadLote"];
    _descuento = json["Descuento"];
    _urlImagenes = json["UrlImagenes"] != null ? json["UrlImagenes"].cast<String>() : [];
    _tipoUnidad = json["TipoUnidad"];
    _negocioProductoId = json["NegocioProductoId"];
    _caracteristicasProductoId = json["CaracteristicasProductoId"];
    if (json["categoriaItems"] != null) {
      _categoriaItems = [];
      json["categoriaItems"].forEach((v) {
        _categoriaItems.add(CategoriaItems.fromJson(v));
      });
    }
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
    if (_categoriaItems != null) {
      map["categoriaItems"] = _categoriaItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : "de65d5f2-b358-4074-b1ef-b36b66e066d6"
/// CategoriasItemProductoId : "5172c0f6-6f35-4483-81a8-6d601e9abb68"
/// CategoriasItemId : "e2fd8288-ee50-47c1-a804-f1241c9f9aab"
/// Categoria : {"Id":"e2fd8288-ee50-47c1-a804-f1241c9f9aab","Nombre":"Pollo","idpadre":null,"CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}

class CategoriaItems {
  String _id;
  String _categoriasItemProductoId;
  String _categoriasItemId;
  Categoria _categoria;

  String get id => _id;
  String get categoriasItemProductoId => _categoriasItemProductoId;
  String get categoriasItemId => _categoriasItemId;
  Categoria get categoria => _categoria;

  CategoriaItems({
      String id, 
      String categoriasItemProductoId, 
      String categoriasItemId, 
      Categoria categoria}){
    _id = id;
    _categoriasItemProductoId = categoriasItemProductoId;
    _categoriasItemId = categoriasItemId;
    _categoria = categoria;
}

  CategoriaItems.fromJson(dynamic json) {
    _id = json["Id"];
    _categoriasItemProductoId = json["CategoriasItemProductoId"];
    _categoriasItemId = json["CategoriasItemId"];
    _categoria = json["Categoria"] != null ? Categoria.fromJson(json["Categoria"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["CategoriasItemProductoId"] = _categoriasItemProductoId;
    map["CategoriasItemId"] = _categoriasItemId;
    if (_categoria != null) {
      map["Categoria"] = _categoria.toJson();
    }
    return map;
  }

}

/// Id : "e2fd8288-ee50-47c1-a804-f1241c9f9aab"
/// Nombre : "Pollo"
/// idpadre : null
/// CategoriaNegocioId : "5665eeb1-52d8-48d5-8aea-caa330af9723"

class Categoria {
  String _id;
  String _nombre;
  dynamic _idpadre;
  String _categoriaNegocioId;

  String get id => _id;
  String get nombre => _nombre;
  dynamic get idpadre => _idpadre;
  String get categoriaNegocioId => _categoriaNegocioId;

  Categoria({
      String id, 
      String nombre, 
      dynamic idpadre, 
      String categoriaNegocioId}){
    _id = id;
    _nombre = nombre;
    _idpadre = idpadre;
    _categoriaNegocioId = categoriaNegocioId;
}

  Categoria.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _idpadre = json["idpadre"];
    _categoriaNegocioId = json["CategoriaNegocioId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["idpadre"] = _idpadre;
    map["CategoriaNegocioId"] = _categoriaNegocioId;
    return map;
  }

}