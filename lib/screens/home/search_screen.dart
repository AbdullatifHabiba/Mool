import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/states/items_list.dart';
import 'package:mool/widgets/Custom_elevated_button.dart';
import 'package:mool/widgets/home_widgets/search_custom_input.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    final searchQuery = ref.read(searchQueryProvider);
    _searchController = TextEditingController(text: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ExpandableSearchBar(
          isOpened: true,
          controller: _searchController,
          onChanged: (query) {
            ref.read(searchQueryProvider.notifier).state = query;
          },
          onClear: () {
            ref.read(searchQueryProvider.notifier).state = '';
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          buildSearchSection('Top Searches', ['Tops', 'Polo', 'ZARA']),
          const SizedBox(height: 16),
          buildRecentSearches(),
          const SizedBox(height: 30),
          Center(
              child:
                  buildSearchButton()), // Add the search button at the bottom
        ],
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
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Wrap(
            spacing: 8,
            children: searches.map((search) {
              return GestureDetector(
                onTap: () {
                  ref.read(searchQueryProvider.notifier).state = search;
                  Navigator.of(context).pop();
                },
                child: Chip(
                  label: Text(search),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Searches',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView(
          shrinkWrap: true,
          children: [
            buildRecentSearchItem('Zara tops'),
            buildRecentSearchItem('Zara tops'),
            buildRecentSearchItem('Zara tops'),
          ],
        ),
      ],
    );
  }

  Widget buildRecentSearchItem(String text) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_outward, size: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      tileColor: Colors.white,
      onTap: () {
        ref.read(searchQueryProvider.notifier).state = text;
        Navigator.of(context).pop();
      },
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }

  Widget buildSearchButton() {
    return CustomElevatedButton(
      text: 'Search',
      backgroundColor: Colors.black,
      textColor: Colors.white,
      onPressed: () {
        ref.read(searchQueryProvider.notifier).state = _searchController.text;
        Navigator.of(context).pop();
      },
    );
  }
}