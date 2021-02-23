part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded(this.cart);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CartLoaded && o.cart == cart;
  }

  @override
  int get hashCode => cart.hashCode;
}


class SetPrice extends CartState {
  final String price;
  const SetPrice(this.price);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SetPrice && o.price == price;
  }

  @override
  int get hashCode => price.hashCode;
}

