
import 'package:mool/constants/images.dart';
import 'package:mool/interfaces/product.dart';
class DummyData {
  static List<Product> getProducts() {
    return products;
  }
}
  List<Product> products =
[
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
 