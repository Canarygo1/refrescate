/// Id : "e8d3501c-0c1b-4d31-a477-92b7e3f3cbcb"
/// Nombre : "Chuleton madurado 30 dias"
/// Color : "Black"
/// Descripcion : "Chuleton de maduracion de 30 dias , tierno y sabroso"
/// Precio : 28.1
/// CantidadLote : 1
/// Descuento : 0
/// UrlImagenes : ["1","2","3"]
/// TipoUnidad : "Unidades"
/// NegocioProductoId : "5665eeb1-52d8-48d5-8aea-caa330af9723"
/// CaracteristicasProductoId : "7af0e2df-64c9-4bb1-bed5-2c9b6650be73"
/// categoriaItems : [{"Id":"27cc9e3b-2404-419e-ab40-f0bdab2fa06f","CategoriasItemProductoId":"e8d3501c-0c1b-4d31-a477-92b7e3f3cbcb","CategoriasItemId":"36123c41-4eb6-4b0d-8ca2-c08274de680e","Categoria":{"Id":"36123c41-4eb6-4b0d-8ca2-c08274de680e","Nombre":"Ternera","idpadre":null,"IconURL":"https://louvre.s3.fr-par.scw.cloud/beef.png","CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}},{"Id":"235c83d6-3f24-4899-8a64-acdeafa3e5cb","CategoriasItemProductoId":"e8d3501c-0c1b-4d31-a477-92b7e3f3cbcb","CategoriasItemId":"016639e2-7eac-4945-bcc8-ceac7004f7bf","Categoria":{"Id":"016639e2-7eac-4945-bcc8-ceac7004f7bf","Nombre":"Carnes asar","idpadre":"38ffd7c8-a381-457f-a263-6457a9a7d873","IconURL":null,"CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}},{"Id":"c302ee4b-de20-48d8-ba35-de02326631b2","CategoriasItemProductoId":"e8d3501c-0c1b-4d31-a477-92b7e3f3cbcb","CategoriasItemId":"11617599-53e1-4e6d-9b25-627601413a68","Categoria":{"Id":"11617599-53e1-4e6d-9b25-627601413a68","Nombre":"Chuletas y solomillos","idpadre":"36123c41-4eb6-4b0d-8ca2-c08274de680e","IconURL":null,"CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}}]
/// caracteristica : {"Id":"7af0e2df-64c9-4bb1-bed5-2c9b6650be73","Nombre":"Corte Chuleton","Caracteristicas":[{"Id":"bef62e12-a7de-4b0d-94c8-d7d987e97095","Nombre":"fino","Aumento":"0.00","CaracteristicaId":"7af0e2df-64c9-4bb1-bed5-2c9b6650be73"},{"Id":"20d7e70f-ff97-4626-88e3-29f0c463efe4","Nombre":"grueso","Aumento":"10.00","CaracteristicaId":"7af0e2df-64c9-4bb1-bed5-2c9b6650be73"}]}

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
  String _caracteristicasProductoId;
  List<CategoriaItems> _categoriaItems;
  Caracteristica _caracteristica;

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
  String get caracteristicasProductoId => _caracteristicasProductoId;
  List<CategoriaItems> get categoriaItems => _categoriaItems;
  Caracteristica get caracteristica => _caracteristica;

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
      String caracteristicasProductoId, 
      List<CategoriaItems> categoriaItems, 
      Caracteristica caracteristica}){
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
    _caracteristica = caracteristica;
}

  Product.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _color = json["Color"];
    _descripcion = json["Descripcion"];
    if(json["Precio"] is int){
      _precio = (json["Precio"]).toDouble();

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
    _caracteristica = json["Caracteristica"] != null ? Caracteristica.fromJson(json["Caracteristica"]) : null;
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
    if (_caracteristica != null) {
      map["Caracteristica"] = _caracteristica.toJson();
    }
    return map;
  }

}

/// Id : "7af0e2df-64c9-4bb1-bed5-2c9b6650be73"
/// Nombre : "Corte Chuleton"
/// Caracteristicas : [{"Id":"bef62e12-a7de-4b0d-94c8-d7d987e97095","Nombre":"fino","Aumento":"0.00","CaracteristicaId":"7af0e2df-64c9-4bb1-bed5-2c9b6650be73"},{"Id":"20d7e70f-ff97-4626-88e3-29f0c463efe4","Nombre":"grueso","Aumento":"10.00","CaracteristicaId":"7af0e2df-64c9-4bb1-bed5-2c9b6650be73"}]

class Caracteristica {
  String _id;
  String _nombre;
  List<Caracteristicas> _caracteristicas;

  String get id => _id;
  String get nombre => _nombre;
  List<Caracteristicas> get caracteristicas => _caracteristicas;

  Caracteristica({
      String id, 
      String nombre, 
      List<Caracteristicas> caracteristicas}){
    _id = id;
    _nombre = nombre;
    _caracteristicas = caracteristicas;
}

  Caracteristica.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    if (json["Caracteristicas"] != null) {
      _caracteristicas = [];
      json["Caracteristicas"].forEach((v) {
        _caracteristicas.add(Caracteristicas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    if (_caracteristicas != null) {
      map["Caracteristicas"] = _caracteristicas.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : "bef62e12-a7de-4b0d-94c8-d7d987e97095"
/// Nombre : "fino"
/// Aumento : "0.00"
/// CaracteristicaId : "7af0e2df-64c9-4bb1-bed5-2c9b6650be73"

class Caracteristicas {
  String _id;
  String _nombre;
  String _aumento;
  String _caracteristicaId;

  String get id => _id;
  String get nombre => _nombre;
  String get aumento => _aumento;
  String get caracteristicaId => _caracteristicaId;

  Caracteristicas({
      String id, 
      String nombre, 
      String aumento, 
      String caracteristicaId}){
    _id = id;
    _nombre = nombre;
    _aumento = aumento;
    _caracteristicaId = caracteristicaId;
}

  Caracteristicas.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _aumento = json["Aumento"];
    _caracteristicaId = json["CaracteristicaId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["Aumento"] = _aumento;
    map["CaracteristicaId"] = _caracteristicaId;
    return map;
  }

}

/// Id : "27cc9e3b-2404-419e-ab40-f0bdab2fa06f"
/// CategoriasItemProductoId : "e8d3501c-0c1b-4d31-a477-92b7e3f3cbcb"
/// CategoriasItemId : "36123c41-4eb6-4b0d-8ca2-c08274de680e"
/// Categoria : {"Id":"36123c41-4eb6-4b0d-8ca2-c08274de680e","Nombre":"Ternera","idpadre":null,"IconURL":"https://louvre.s3.fr-par.scw.cloud/beef.png","CategoriaNegocioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"}

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

/// Id : "36123c41-4eb6-4b0d-8ca2-c08274de680e"
/// Nombre : "Ternera"
/// idpadre : null
/// IconURL : "https://louvre.s3.fr-par.scw.cloud/beef.png"
/// CategoriaNegocioId : "5665eeb1-52d8-48d5-8aea-caa330af9723"

class Categoria {
  String _id;
  String _nombre;
  dynamic _idpadre;
  String _iconURL;
  String _categoriaNegocioId;

  String get id => _id;
  String get nombre => _nombre;
  dynamic get idpadre => _idpadre;
  String get iconURL => _iconURL;
  String get categoriaNegocioId => _categoriaNegocioId;

  Categoria({
      String id, 
      String nombre, 
      dynamic idpadre, 
      String iconURL, 
      String categoriaNegocioId}){
    _id = id;
    _nombre = nombre;
    _idpadre = idpadre;
    _iconURL = iconURL;
    _categoriaNegocioId = categoriaNegocioId;
}

  Categoria.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _idpadre = json["idpadre"];
    _iconURL = json["IconURL"];
    _categoriaNegocioId = json["CategoriaNegocioId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["idpadre"] = _idpadre;
    map["IconURL"] = _iconURL;
    map["CategoriaNegocioId"] = _categoriaNegocioId;
    return map;
  }

}