/// url : "https://sis-t.redsys.es:25443/sis/realizarPago"
/// body : {"Ds_SignatureVersion":"HMAC_SHA256_V1","Ds_MerchantParameters":"eyJEU19NRVJDSEFOVF9BTU9VTlQiOiI0MDkwIiwiRFNfTUVSQ0hBTlRfQ1VSUkVOQ1kiOiI5NzgiLCJEU19NRVJDSEFOVF9PUkRFUiI6IjY2MTI5T1dtcTdCdyIsIkRTX01FUkNIQU5UX01FUkNIQU5UTkFNRSI6Ik1JIENPTUVSQ0lPIiwiRFNfTUVSQ0hBTlRfTUVSQ0hBTlRDT0RFIjoiOTk5MDA4ODgxIiwiRFNfTUVSQ0hBTlRfVEVSTUlOQUwiOiIxIiwiRFNfTUVSQ0hBTlRfVFJBTlNBQ1RJT05UWVBFIjoiNyIsIkRTX01FUkNIQU5UX01FUkNIQU5UVVJMIjoiaHR0cDovLzE2My4xNzIuMTgzLjE2OjMxNDY5L3VzZXIvcGF5bWVudENoZWNrIiwiRFNfTUVSQ0hBTlRfVVJMT0siOiJodHRwczovL3d3dy5yZXNlcnZhbG8uYXBwIiwiRFNfTUVSQ0hBTlRfVVJMS08iOiJodHRwczovL3d3dy5yZXNlcnZhbG8uYXBwL2NhcnRhcy9lcnZhemEifQ==","Ds_Signature":"DLvh9mMBFFDSTCiPMkex+LTOnlh6e9PlbsCzwxiYpec="}

class PaymentData {
  String _url;
  Body _body;

  String get url => _url;
  Body get body => _body;

  PaymentData({
      String url, 
      Body body}){
    _url = url;
    _body = body;
}

  PaymentData.fromJson(dynamic json) {
    _url = json["url"];
    _body = json["body"] != null ? Body.fromJson(json["body"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    if (_body != null) {
      map["body"] = _body.toJson();
    }
    return map;
  }

}

/// Ds_SignatureVersion : "HMAC_SHA256_V1"
/// Ds_MerchantParameters : "eyJEU19NRVJDSEFOVF9BTU9VTlQiOiI0MDkwIiwiRFNfTUVSQ0hBTlRfQ1VSUkVOQ1kiOiI5NzgiLCJEU19NRVJDSEFOVF9PUkRFUiI6IjY2MTI5T1dtcTdCdyIsIkRTX01FUkNIQU5UX01FUkNIQU5UTkFNRSI6Ik1JIENPTUVSQ0lPIiwiRFNfTUVSQ0hBTlRfTUVSQ0hBTlRDT0RFIjoiOTk5MDA4ODgxIiwiRFNfTUVSQ0hBTlRfVEVSTUlOQUwiOiIxIiwiRFNfTUVSQ0hBTlRfVFJBTlNBQ1RJT05UWVBFIjoiNyIsIkRTX01FUkNIQU5UX01FUkNIQU5UVVJMIjoiaHR0cDovLzE2My4xNzIuMTgzLjE2OjMxNDY5L3VzZXIvcGF5bWVudENoZWNrIiwiRFNfTUVSQ0hBTlRfVVJMT0siOiJodHRwczovL3d3dy5yZXNlcnZhbG8uYXBwIiwiRFNfTUVSQ0hBTlRfVVJMS08iOiJodHRwczovL3d3dy5yZXNlcnZhbG8uYXBwL2NhcnRhcy9lcnZhemEifQ=="
/// Ds_Signature : "DLvh9mMBFFDSTCiPMkex+LTOnlh6e9PlbsCzwxiYpec="

class Body {
  String _dsSignatureVersion;
  String _dsMerchantParameters;
  String _dsSignature;

  String get dsSignatureVersion => _dsSignatureVersion;
  String get dsMerchantParameters => _dsMerchantParameters;
  String get dsSignature => _dsSignature;

  Body({
      String dsSignatureVersion, 
      String dsMerchantParameters, 
      String dsSignature}){
    _dsSignatureVersion = dsSignatureVersion;
    _dsMerchantParameters = dsMerchantParameters;
    _dsSignature = dsSignature;
}

  Body.fromJson(dynamic json) {
    _dsSignatureVersion = json["Ds_SignatureVersion"];
    _dsMerchantParameters = json["Ds_MerchantParameters"];
    _dsSignature = json["Ds_Signature"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Ds_SignatureVersion"] = _dsSignatureVersion;
    map["Ds_MerchantParameters"] = _dsMerchantParameters;
    map["Ds_Signature"] = _dsSignature;
    return map;
  }

}