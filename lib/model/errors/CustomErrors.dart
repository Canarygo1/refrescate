class JwtExpiredError implements Exception {
  String cause;
  JwtExpiredError(this.cause);
}

