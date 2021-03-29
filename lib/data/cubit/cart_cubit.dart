import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:refrescate/data/RemoteRepository.dart';
import 'package:refrescate/model/Order.dart';
import 'package:refrescate/model/PaymentData.dart';
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

  Future<void> addItemCart(String userId,String unit, String productId, {String cutId}) async {
    if(unit == "Unidades"){
      await _remoteRepository.addItemCart(userId, cart.id, productId, cutId:cutId);
    }else{
      await _remoteRepository.addItemCartWeight(userId, cart.id, productId, cutId:cutId);
    }
    cart = await _remoteRepository.getActiveCart(userId);

    emit(CartLoaded(cart));
  }

  Future<void> deleteItemCart(String userId, String cartItemId) async {
    await _remoteRepository.deleteCartItem(userId, cart.id, cartItemId);
    cart = await _remoteRepository.getActiveCart(userId);
    emit(CartLoaded(cart));
  }
  Future<void> updateItemCart(String userId, String unit, String cartItemId,String weight, int quantity, {String cutId}) async {
    if(unit == "Unidades" ){
      await _remoteRepository.updateCartItemQuantity(userId, cart.id, cartItemId, quantity, cutId:cutId);

    }else{
      await _remoteRepository.updateCartItemWeight(userId, cart.id, cartItemId, weight);
    }
    cart = await _remoteRepository.getActiveCart(userId);
    emit(CartLoaded(cart));
  }
  Future<PaymentData> createOrder(String userId, String fechaEntrega, double precioTotal) async{
    String businessId = "5665eeb1-52d8-48d5-8aea-caa330af9723";
    PaymentData paymentData = await _remoteRepository.createOrder(userId, fechaEntrega, businessId, precioTotal);

    // await _remoteRepository.createCart(userId);
    // cart = await _remoteRepository.getActiveCart(userId);
    // emit(CartLoaded(cart));
    //Saltar a pantalla compra realizada con exito
    return paymentData;
  }
}
