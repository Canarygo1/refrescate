import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPresenter{
  final SplashView _view;

  SplashPresenter(this._view);

  final _storage = FlutterSecureStorage();

  checkUserLogged() async {
    Map<String, String> data =await _storage.readAll();
    if(data.keys.contains("accessToken") && data.keys.contains("refreshToken") && data.keys.contains("userId")){
      _view.userIsLogged();
    }
    else{
      _view.userNotLogged();
    }
  }
}
abstract class SplashView{
  userIsLogged();
  userNotLogged();
}