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
