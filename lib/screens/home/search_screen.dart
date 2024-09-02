import 'package:flutter/material.dart';
import 'package:mool/widgets/home_widgets/search_cutom_input.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ExpandableSearchBar(),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            buildSearchSection('Top Searches', ['Tops', 'Polo', 'ZARA']),
            const SizedBox(height: 16),
            buildSearchSection('Recent Searches', ['Zara tops', 'Zara tops', 'Zara tops']),
          ],
        ),
      ),
    );
  }

  Widget buildSearchSection(String title, List<String> searches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 8,
          children: searches.map((search) {
            return Chip(label: Text(search));
          }).toList(),
        ),
      ],
    );
  }
}
