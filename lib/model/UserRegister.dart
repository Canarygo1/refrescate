// {
// "Id":"669b3c4f-5540-4fd4-8601-9f83d5b4ad45",
// "Nombre": "Discarten",
// "Apellidos": "Admin",
// "Email": "b2@gmail.com",
// "Telefono": "922501923",
// "Direccion": "C/ La petanca 34, 38530",
// "CodigoPostal": "33330",
// "NegocioUsuarioId":"5665eeb1-52d8-48d5-8aea-caa330af9723"
// }

class UserRegister{
 String _id;
 String _email;
 String _password;
 String _name;
 String _surname;
 String _phoneNumber;
 String _address;
 String _postalCode;
 String _businessId;
 UserRegister();

 String get id => _id;

  set businessId(String value) {
    _businessId = value;
  }

  set postalCode(String value) {
    _postalCode = value;
  }

  set address(String value) {
    _address = value;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set surname(String value) {
    _surname = value;
  }

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }

  set id(String value) {
    _id = value;
  }

 String get email => _email;

 String get password => _password;

 String get name => _name;

 String get surname => _surname;

 String get phoneNumber => _phoneNumber;

 String get address => _address;

 String get postalCode => _postalCode;

 String get businessId => _businessId;
}