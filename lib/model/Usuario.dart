
/// Id : "4ad8d937-52a4-4f43-a435-bfad4a879e5a"
/// Nombre : "Alejandro"
/// Apellidos : "Cruz"
/// Email : "1@gmail.com"
/// Telefono : "607977602"
/// Direccion : "C/ La petanca 34, 38530"
/// CodigoPostal : "38530"
/// NegocioUsuarioId : "5665eeb1-52d8-48d5-8aea-caa330af9723"

class Usuario {
  String _id;
  String _nombre;
  String _apellidos;
  String _email;
  String _telefono;
  String _direccion;
  String _codigoPostal;
  String _negocioUsuarioId;

  String get id => _id;
  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get email => _email;
  String get telefono => _telefono;
  String get direccion => _direccion;
  String get codigoPostal => _codigoPostal;
  String get negocioUsuarioId => _negocioUsuarioId;

  Usuario({
    String id,
    String nombre,
    String apellidos,
    String email,
    String telefono,
    String direccion,
    String codigoPostal,
    String negocioUsuarioId}){
    _id = id;
    _nombre = nombre;
    _apellidos = apellidos;
    _email = email;
    _telefono = telefono;
    _direccion = direccion;
    _codigoPostal = codigoPostal;
    _negocioUsuarioId = negocioUsuarioId;
  }

  Usuario.fromJson(dynamic json) {
    _id = json["Id"];
    _nombre = json["Nombre"];
    _apellidos = json["Apellidos"];
    _email = json["Email"];
    _telefono = json["Telefono"];
    _direccion = json["Direccion"];
    _codigoPostal = json["CodigoPostal"];
    _negocioUsuarioId = json["NegocioUsuarioId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["Nombre"] = _nombre;
    map["Apellidos"] = _apellidos;
    map["Email"] = _email;
    map["Telefono"] = _telefono;
    map["Direccion"] = _direccion;
    map["CodigoPostal"] = _codigoPostal;
    map["NegocioUsuarioId"] = _negocioUsuarioId;
    return map;
  }

}