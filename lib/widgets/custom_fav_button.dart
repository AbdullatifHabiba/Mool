import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/interfaces/product.dart';
import 'package:mool/states/items_list.dart';

class CustomFavButton extends ConsumerWidget {
  final Product product;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  const CustomFavButton({
    super.key,
    required this.product,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProductsProvider).contains(product);

    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: GestureDetector(
        onTap: () {
          ref.read(favoriteProductsProvider.notifier).toggleFavorite(product);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isFavorite ? Colors.red : Colors.transparent,
              width: 2,
            ),
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 20,
            color: isFavorite ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}