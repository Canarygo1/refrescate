import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/data/cubit/cart_cubit.dart';
import 'package:refrescate/model/cart.dart';

class ProductInfoPresenter{
  ProductInfoView _view;
  RemoteRepository _remoteRepository;
  CartCubit _cartCubit;
  ProductInfoPresenter(this._view, this._remoteRepository, this._cartCubit);

  addProductToCart(String productId){
    String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";
    _cartCubit.addItemCart(userId, productId);

  }
  updateProductCart(String cartItemId, int quantity){
    String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";
    _cartCubit.updateQuantity(userId, cartItemId, quantity);

  }
  deleteProductCart(String cartItemId){

    String userId = "4ad8d937-52a4-4f43-a435-bfad4a879e5a";
    _cartCubit.deleteItemCart(userId, cartItemId);
  }
  initialQuantity(Cart cart, String productId){
  for(int i = 0; i<cart.carritosItems.length; i++){
    if(productId == cart.carritosItems[i].id){
      _view.setInitialQuantity(cart.carritosItems[i].cantidad.toString()+" Unidades");
    }
  }
  }

}

abstract class ProductInfoView{
  productQuantityUpdated(int quantity);
  productQuantityError();
  setInitialQuantity(String initialQuantity);
}