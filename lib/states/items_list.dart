import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/data/items.dart';
import 'package:mool/interfaces/product.dart';

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
  final products = DummyData.getProducts();
   return ProductListNotifier(products);
});

// State provider to manage the selected tab in the home screen
final selectedGenderTabProvider = StateProvider<String>((ref) => 'Women');

// State provider for managing the product list (Best Sellers or New Arrivals)
final isBestSellersProvider = StateProvider<bool>((ref) => false);

// Favorite products provider
class FavoriteProductsNotifier extends StateNotifier<List<Product>> {
  List<Product> _allFavorites = [];

  FavoriteProductsNotifier() : super([]);

  void toggleFavorite(Product product) {
    if (_allFavorites.contains(product)) {
      _allFavorites = _allFavorites.where((p) => p != product).toList();
    } else {
      _allFavorites = [..._allFavorites, product];
    }
    state = _allFavorites;
  }

  bool isFavorite(Product product) {
    return _allFavorites.contains(product);
  }

  void filterFavoriteProducts({required String category}) {
    state = _allFavorites.where((product) {
      final matchesCategory = category == 'All' || product.category == category;
      return matchesCategory;
    }).toList();
  }
}

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductsNotifier, List<Product>>(
        (ref) => FavoriteProductsNotifier());
        
final searchQueryProvider = StateProvider<String>((ref) => '');