import 'package:refrescate/data/RemoteRepository.dart';

class LoginPresenter{
  RemoteRepository _remoteRepository;
  LoginView _view;

  LoginPresenter(this._remoteRepository, this._view);
  onLogin(String email, password) async {
    bool response = await _remoteRepository.login(email, password);

    if(response == true){
      _view.loginSuccessfully();
    }
  }
}

abstract class LoginView{
  loginSuccessfully();
  loginError();
}