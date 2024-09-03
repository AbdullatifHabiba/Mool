import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;
  final bool isBest;

  const ProductItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.isBest,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false; // State to manage favorite selection

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  widget.imagePath,
                   width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              if (widget.isBest)
                Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isFavorite ? Colors.red : Colors.transparent,
                          width: 2),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(children: [
            // Details Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.isBest)
                        Text(
                          widget.price,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                        ),
                      Text(
                        widget.isBest
                            ? ' ${(double.parse(widget.price) * 0.8).toStringAsFixed(2)} SAR'
                            : '${widget.price} SAR',
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
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF292D32),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 16),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
