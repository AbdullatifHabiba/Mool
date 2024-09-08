import 'package:flutter/material.dart';

Widget buildColorOption(Color color) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 1),
    ),
  );
}

Widget buildRatingBreakdown() {
  return Column(
    children: [
      buildRatingRow(5, 0.5),
      buildRatingRow(4, 0.3),
      buildRatingRow(3, 0.1),
      buildRatingRow(2, 0.05),
      buildRatingRow(1, 0.05),
    ],
  );
}

Widget buildRatingRow(int star, double percentage) {
  return Row(
    children: [
      Text('$star Star'),
      const SizedBox(width: 8),
      Expanded(
        child: LinearProgressIndicator(value: percentage),
      ),
      const SizedBox(width: 8),
      Text('${(percentage * 100).toInt()}%'),
    ],
  );
}

Widget buildReview() {
  return const ListTile(
    leading: CircleAvatar(
      child: Icon(Icons.person),
    ),
    title: Text('Nourhan Selim'),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text('1st August 2022'),
        SizedBox(height: 8),
        Text(
          'Very elegant product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Very nice and elegant product and the fabric is awesome'),
      ],
    ),
  );
}