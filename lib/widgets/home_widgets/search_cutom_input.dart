import 'package:flutter/material.dart';

class ExpandableSearchBar extends StatefulWidget {
  const ExpandableSearchBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableSearchBarState createState() => _ExpandableSearchBarState();
}

class _ExpandableSearchBarState extends State<ExpandableSearchBar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: _isExpanded ? MediaQuery.of(context).size.width * 0.7 : 48, // Reduced from 65 to 48
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          iconButton(),
          if (_isExpanded)
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  fillColor: Colors.grey[800],
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget iconButton() {
    return IconButton(
      icon: const Icon(Icons.search, color: Colors.white),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(), // Removes default padding
    );
  }
}