import 'package:refrescate/model/cart.dart';

abstract class LocalRepository{

  Future<int> insertCart(Cart cart);

}
