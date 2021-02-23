import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Product.dart';

class HomePresenter{
  HomeView _view;
  RemoteRepository _remoteRepository;

  HomePresenter(this._view, this._remoteRepository);

  init() async {
    try {
      String businessId = "5665eeb1-52d8-48d5-8aea-caa330af9723";
      List<Product> products = await _remoteRepository.getProducts(businessId);
      _view.setProducts(products);

    }
    catch(e) {
    }
  }
  getActiveCart(){
    String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";

  }
}
abstract class HomeView{
  setProducts(List<Product> products);
}
