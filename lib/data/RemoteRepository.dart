import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/cart.dart';

abstract class RemoteRepository{

  Future<List<Product>> getProducts(String businessId);
  Future<Cart> getActiveCart(String userId);
  Future<bool> addItemCart(String userId,String cartId,String productId);
  Future<bool> deleteCartItem(String userId,String cartId ,String cartItemId);
  Future<bool> updateCartItemQuantity(String userId,String cartId ,String cartItemId, int quantity);
  Future<List<Order>> getOrders(String userId);
  Future<bool> createOrder(String userId, String fechaEntrega,String businessId, double precioTotal);
  Future<bool> createCart(String userId);
}
