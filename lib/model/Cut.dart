/// Id : "bef62e12-a7de-4b0d-94c8-d7d987e97095"
/// Nombre : "fino"
/// Aumento : "0.00"
/// CaracteristicaId : "7af0e2df-64c9-4bb1-bed5-2c9b6650be73"

class Cut {
  String _id;
  String _nombre;
  String _aumento;
  String _caracteristicaId;

  String get id => _id;
  String get nombre => _nombre;
  String get aumento => _aumento;
  String get caracteristicaId => _caracteristicaId;

  Cut({
      String id, 
      String nombre, 
      String aumento, 
      String caracteristicaId}){
    _id = id;
    _nombre = nombre;
    _aumento = aumento;
    _caracteristicaId = caracteristicaId;
}

  Cut.fromJson(dynamic json) {
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