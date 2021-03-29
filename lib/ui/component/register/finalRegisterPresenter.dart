import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/UserRegister.dart';

class FinalRegisterPresenter{
  RemoteRepository _remoteRepository;
  FinalRegisterView _view;

  FinalRegisterPresenter(this._remoteRepository, this._view);
  userCreation(UserRegister userRegister) async {
    bool response = await _remoteRepository.userCreation(userRegister);
    if(response == true){
      _view.userCreated();
    }else{
      _view.userCreationError();
    }
  }

}
abstract class FinalRegisterView{
  userCreated();
  userCreationError();
}