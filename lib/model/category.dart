/// Id : "80ee0dd4-10de-4e46-94ba-193291d7b26c"
/// Nombre : "Ternera"
/// idpadre : null
/// CategoriaNegocioId : "5665eeb1-52d8-48d5-8aea-caa330af9723"

class Category {
  String _id;
  String _nombre;
  dynamic _idpadre;
  String _categoriaNegocioId;
  String _iconUrl;
  String get id => _id;
  String get iconUrl => _iconUrl;
  String get nombre => _nombre;
  dynamic get idpadre => _idpadre;
  String get categoriaNegocioId => _categoriaNegocioId;

  Category({
      String id, 
      String nombre, 
      dynamic idpadre, 
      String categoriaNegocioId,
  String iconUrl}){
    _id = id;
    _nombre = nombre;
    _idpadre = idpadre;
    _categoriaNegocioId = categoriaNegocioId;
    _iconUrl = iconUrl;
  }

  Category.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _idpadre = json["idpadre"];
    _iconUrl = json["IconURL"];
    _categoriaNegocioId = json["CategoriaNegocioId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["idpadre"] = _idpadre;
    map["CategoriaNegocioId"] = _categoriaNegocioId;
    map["IconURL"] = _iconUrl;
    return map;
  }

}