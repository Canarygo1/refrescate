import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/category.dart';

class HomePresenter {
  HomeView _view;
  RemoteRepository _remoteRepository;

  HomePresenter(this._view, this._remoteRepository);

  init() async {
    try {
      String businessId = "5665eeb1-52d8-48d5-8aea-caa330af9723";
      List<Product> products = await _remoteRepository.getProducts(businessId);
      _view.setProducts(products);
    } catch (e) {}
  }

  getActiveCart() {
    String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";
  }

  categoryFilter(List<Product> products, String categoryId) async {
    List<Product> categoryProducts = [];

    for (int i = 0; i < products.length; i++) {
        for(int e = 0; e<products[i].categoriaItems.length ; e++){
          if(products[i].categoriaItems[e].categoriasItemId == categoryId){
            categoryProducts.add(products[i]);
          }
        }
    }
    _view.setProductsFilter(categoryProducts,categoryId);
  }

  getCategories() async {
    String businessId = "5665eeb1-52d8-48d5-8aea-caa330af9723";
    List<Category> categories =
        await _remoteRepository.getCategories(businessId);
    _view.setCategories(categories);
  }
}

abstract class HomeView {
  setProducts(List<Product> products);
  setProductsFilter(List<Product> filterProducts, String filterCategoryId);
  setCategories(List<Category> categories);
}
