import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/interfaces/product.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  List<Product> _cartProducts = [];

  CartNotifier() : super([]);

  void addProductToCart(Product product) {
    final existingProduct = _cartProducts.firstWhere(
      (p) => p.title == product.title,
      orElse: () => Product(
        title: '',
        imagePath: '',
        price: 0,
        isBest: false,
        category: '',
        rating: 0,
        isNew: false,
        brand: '',
        size: '',
        color: '',
      ),
    );

    if (existingProduct.title.isNotEmpty) {
      incrementQuantity(existingProduct);
    } else {
      _cartProducts = [..._cartProducts, product];
      state = _cartProducts;
    }
  }

  void removeProductFromCart(Product product) {
    _cartProducts = _cartProducts.where((p) => p != product).toList();
    state = _cartProducts;
  }

  void incrementQuantity(Product product) {
    product.quantity++;
    state = [..._cartProducts];
  }

  void decrementQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      removeProductFromCart(product);
    }
    state = [..._cartProducts];
  }

  bool isProductInCart(Product product) {
    return _cartProducts.contains(product);
  }

  void clearCart() {
    _cartProducts = [];
    state = _cartProducts;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
    (ref) => CartNotifier());