import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final RemoteRepository _remoteRepository;
  Cart cart;

  CartCubit(this._remoteRepository) : super(CartInitial());

  Future<void> getCart(String userId) async {
    //TODO: Emit CartLoading
    cart = await _remoteRepository.getActiveCart(userId);
    print(cart.id);
    //TODO: Compare if cart exist return Cart if no exist create and return it.
    emit(CartLoaded(cart));
  }

  Future<void> addItemCart(String userId, String productId) async {
    await _remoteRepository.addItemCart(userId, cart.id, productId);
    cart = await _remoteRepository.getActiveCart(userId);

    emit(CartLoaded(cart));
  }

  Future<void> deleteItemCart(String userId, String cartItemId) async {
    await _remoteRepository.deleteCartItem(userId, cart.id, cartItemId);
    cart = await _remoteRepository.getActiveCart(userId);
    emit(CartLoaded(cart));
  }
  Future<void> updateQuantity(String userId, String cartItemId, int quantity) async {
    await _remoteRepository.updateCartItemQuantity(userId, cart.id, cartItemId, quantity);
    cart = await _remoteRepository.getActiveCart(userId);
    emit(CartLoaded(cart));
  }
  Future<bool> createOrder(String userId, String fechaEntrega, double precioTotal) async{
    String businessId = "5665eeb1-52d8-48d5-8aea-caa330af9723";
    bool order = await _remoteRepository.createOrder(userId, fechaEntrega, businessId, precioTotal);
    await _remoteRepository.createCart(userId);
    cart = await _remoteRepository.getActiveCart(userId);
    emit(CartLoaded(cart));
    //Saltar a pantalla compra realizada con exito
    return true;
  }
}
