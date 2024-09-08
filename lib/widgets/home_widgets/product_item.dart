import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/interfaces/product.dart';
import 'package:mool/screens/product/product_screen.dart';
import 'package:mool/states/cart.dart';
import 'package:mool/widgets/custom_fav_button.dart';

class ProductItem extends ConsumerStatefulWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: widget.product,
              ),
            ),
          );
        },
        child: Container(
          width: 190,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            
            color: _isHovered ? Colors.grey[200] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image Section
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      widget.product.imagePath,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.product.isBest)
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const Text(
                          '20%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  CustomFavButton(
                    product: widget.product,
                    top: 10,
                    right: 10,
                  ),
                ],
              ),
              Stack(
                children: [
                  // Details Section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget.product.isBest)
                              Text(
                                widget.product.price.toString(),
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                ),
                              ),
                            Text(
                              widget.product.isBest
                                  ? ' ${(widget.product.price * 0.8).toStringAsFixed(2)} SAR'
                                  : '${widget.product.price} SAR',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // "Add" Button Section
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        ref.read(cartProvider.notifier).addProductToCart(widget.product);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _isHovered ? Colors.green :const Color(0xFF292D32),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}