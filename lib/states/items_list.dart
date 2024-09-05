import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/constants/images.dart';

// Models
class Product {
  final String title;
  final String imagePath;
  final double price;
  final bool isBest;
  final String category;
  final double rating;
  final bool isNew;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.isBest,
    required this.category,
    required this.rating,
    required this.isNew,
  });
}

// State for managing the list of products
class ProductListNotifier extends StateNotifier<List<Product>> {
  final List<Product> allProducts;

  ProductListNotifier(this.allProducts) : super(allProducts);

  void filterProducts({
    String? category,
    bool? isBest,
    bool? isNew,
  }) {
    state = allProducts.where((product) {
      final matchesCategory = category == null || category == 'All' || product.category == category;
      final matchesBest = isBest == null || product.isBest == isBest;
      final matchesNew = isNew == null || product.isNew == isNew;
      return matchesCategory && matchesBest && matchesNew;
    }).toList();
  }

  void sortProducts(String sortOption) {
    final sortedProducts = List<Product>.from(state);
    switch (sortOption) {
      case 'Price: Low to High':
        sortedProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        sortedProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Rating: High to Low':
        sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    state = sortedProducts;
  }
}

// State for managing selected filter options
class FilterNotifier extends StateNotifier<Map<String, String>> {
  FilterNotifier() : super({'category': 'All'});

  void setFilter(String key, String value) {
    state = {...state, key: value};
  }

  void resetFilters() {
    state = {'category': 'All'};
  }

  String getFilter(String key) {
    return state[key] ?? 'All';
  }

  Map<String, String> getFilters() {
    return state;
  }
}

// State for managing selected sorting option
class SortNotifier extends StateNotifier<String> {
  SortNotifier() : super('');

  void setSort(String sort) {
    state = sort;
  }
}

// Providers
final filterProvider = StateNotifierProvider<FilterNotifier, Map<String, String>>(
    (ref) => FilterNotifier());

final sortProvider = StateNotifierProvider<SortNotifier, String>(
    (ref) => SortNotifier());

// Sample product list
final productListProvider = StateNotifierProvider<ProductListNotifier, List<Product>>(
    (ref) {
  final products = [
    Product(
        title: 'Elegant Dress',
        imagePath: Images.accessories,
        price: 2500,
        isBest: true,
        category: 'Dresses',
        rating: 4.5,
        isNew: false),
    Product(
        title: 'Casual Shirt',
        imagePath: Images.accessories,
        price: 2560,
        isBest: true,
        category: 'Tops',
        rating: 4.0,
        isNew: false),
    Product(
        title: 'Jeans',
        imagePath: Images.accessories,
        price: 6500,
        isBest: true,
        category: 'Bottoms',
        rating: 4.8,
        isNew: false),
    Product(
        title: 'T-Shirt',
        imagePath: Images.accessories,
        price: 8500,
        isBest: true,
        category: 'T-Shirts',
        rating: 3.9,
        isNew: false),
    Product(
        title: 'Skirt',
        imagePath: Images.accessories,
        price: 250,
        isBest: false,
        category: 'Bottoms',
        rating: 4.2,
        isNew: true),
    Product(
        title: 'Blouse',
        imagePath: Images.accessories,
        price: 2100,
        isBest: false,
        category: 'Tops',
        rating: 4.1,
        isNew: true),
    Product(
        title: 'Jacket',
        imagePath: Images.accessories,
        price: 250,
        isBest: false,
        category: 'Tops',
        rating: 3.5,
        isNew: true),
    Product(
        title: 'Shorts',
        imagePath: Images.accessories,
        price: 200,
        isBest: false,
        category: 'Bottoms',
        rating: 4.0,
        isNew: true),
  ];
  return ProductListNotifier(products);
});

// State provider to manage the selected tab in the home screen
final selectedGenderTabProvider = StateProvider<String>((ref) => 'Women');

// State provider for managing the product list (Best Sellers or New Arrivals)
final isBestSellersProvider = StateProvider<bool>((ref) => false);

// Favorite products provider
class FavoriteProductsNotifier extends StateNotifier<List<Product>> {
  FavoriteProductsNotifier() : super([]);

  void toggleFavorite(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p != product).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isFavorite(Product product) {
    return state.contains(product);
  }

  void filterFavoriteProducts({required String category}) {
    state = state.where((product) {
      final matchesCategory = category == 'All' || product.category == category;
      return matchesCategory;
    }).toList();
  }
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductsNotifier, List<Product>>(
        (ref) => FavoriteProductsNotifier());