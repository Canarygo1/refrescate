import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/PaymentData.dart';
import 'package:refrescate/model/Product.dart';
import 'package:refrescate/model/cart.dart';
import 'package:refrescate/model/category.dart';

abstract class RemoteRepository{

  Future<List<Product>> getProducts(String businessId);
  Future<Cart> getActiveCart(String userId);
  Future<bool> addItemCart(String userId,String cartId,String productId,{String cutId});
  Future<bool> addItemCartWeight(String userId,String cartId,String productId,{String cutId});
  Future<bool> deleteCartItem(String userId,String cartId ,String cartItemId);
  Future<bool> updateCartItemQuantity(String userId,String cartId ,String cartItemId, int quantity, {String cutId});
  Future<bool> updateCartItemWeight(String userId,String cartId ,String cartItemId, String weight, {String cutId});
  Future<List<Order>> getOrders(String userId);
  Future<PaymentData> createOrder(String userId, String fechaEntrega,String businessId, double precioTotal);
  Future<bool> createCart(String userId);
  Future<List<Category>> getCategories(String businessId);
}
