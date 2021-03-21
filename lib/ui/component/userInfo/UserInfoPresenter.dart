import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Usuario.dart';
import 'package:refrescate/model/errors/CustomErrors.dart';

class UserInfoPresenter {
  UserInfoView _view;
  RemoteRepository _remoteRepository;

  UserInfoPresenter(this._view, this._remoteRepository);

  String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";

  getUserInfo() async {
    try{
      Usuario user = await _remoteRepository.getUser(userId);
      _view.setUserInfo(user);
    }
    on JwtExpiredError{
      String refreshToken = await _remoteRepository.getUserRefreshToken();
      await _remoteRepository.updateAccessToken(refreshToken);
      getUserInfo();
    }
  }

  logOut() async {

    bool logOutResponse = await _remoteRepository.logOut();
    if (logOutResponse == true) {
      _view.logOut();
    }
  }
}

abstract class UserInfoView {
  logOut();
  setUserInfo(Usuario user);
}
