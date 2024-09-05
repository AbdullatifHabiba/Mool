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
  final String brand;
  final String size;
  final String color;

  Product({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.isBest,
    required this.category,
    required this.rating,
    required this.isNew,
    required this.brand,
    required this.size,
    required this.color,
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
    String? brand,
    String? priceRange,
    String? rating,
    String? size,
    String? color,
  }) {
    state = allProducts.where((product) {
      final matchesCategory = category == 'All' ||category == '' || category == null || product.category == category;
      final matchesBest = isBest == null || product.isBest == isBest;
      final matchesNew = isNew == null || product.isNew == isNew;
      final matchesBrand = brand==null||brand == '' || product.brand == brand;
      final matchesPriceRange =priceRange == null|| priceRange == '' || _matchesPriceRange(product.price, priceRange);
      final matchesRating = rating==null||rating == '' || product.rating.toString() == rating;
      final matchesSize =  size == null ||size == '' || product.size == size;
      final matchesColor = color == null ||color == '' || product.color == color;
      return matchesCategory && matchesBest && matchesNew && matchesBrand && matchesPriceRange && matchesRating && matchesSize && matchesColor;
    }).toList();
  }

  bool _matchesPriceRange(double price, String priceRange) {
    switch (priceRange) {
      
      case '0 - 50':
        return price >= 0 && price <= 50;
      case '50 - 100':
        return price > 50 && price <= 100;
      case '100 - 500':
        return price > 100 && price <= 500;
      case '500 - 1000':
        return price > 500 && price <= 1000;
      case '1000+':
        return price > 1000;
      default:
        return false;
    }
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
    state = {
      'category': 'All',
      'brand': '',
      'priceRange': '',
      'rating': '',
      'size': '',
      'color': '',
    };

  }

  String getFilter(String key) {
    return state[key] ?? '';
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
        isNew: false,
        brand: 'Brand A',
        size: 'M',
        color: 'Red'),
    Product(
        title: 'Casual Shirt',
        imagePath: Images.accessories,
        price: 2560,
        isBest: true,
        category: 'Tops',
        rating: 4.0,
        isNew: false,
        brand: 'Brand B',
        size: 'L',
        color: 'Blue'),
    Product(
        title: 'Jeans',
        imagePath: Images.accessories,
        price: 6500,
        isBest: true,
        category: 'Bottoms',
        rating: 4.8,
        isNew: false,
        brand: 'Brand A',
        size: 'S',
        color: 'Red'),
    Product(
        title: 'T-Shirt',
        imagePath: Images.accessories,
        price: 8500,
        isBest: true,
        category: 'T-Shirts',
        rating: 3.9,
        isNew: false,
        brand: 'Brand B',
        size: 'M',
        color: 'Blue'),
    Product(
        title: 'Skirt',
        imagePath: Images.accessories,
        price: 250,
        isBest: false,
        category: 'Bottoms',
        rating: 4.2,
        isNew: true,
        brand: 'Brand A',
        size: 'L',
        color: 'Red'),
    Product(
        title: 'Blouse',
        imagePath: Images.accessories,
        price: 2100,
        isBest: false,
        category: 'Tops',
        rating: 4.1,
        isNew: true,
        brand: 'Brand B',
        size: 'S',
        color: 'Blue'),
    Product(
        title: 'Jacket',
        imagePath: Images.accessories,
        price: 250,
        isBest: false,
        category: 'Tops',
        rating: 3.5,
        isNew: true,
        brand: 'Brand A',
        size: 'M',
        color: 'Red'),
    Product(
        title: 'Shorts',
        imagePath: Images.accessories,
        price: 200,
        isBest: false,
        category: 'Bottoms',
        rating: 4.0,
        isNew: true,
        brand: 'Brand B',
        size: 'L',
        color: 'Blue'),
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