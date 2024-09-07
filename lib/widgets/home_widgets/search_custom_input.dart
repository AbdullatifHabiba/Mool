import 'package:flutter/material.dart';
import 'package:mool/constants/titles.dart';
import 'package:mool/screens/home/search_screen.dart';

class ExpandableSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final bool isOpened;

  const ExpandableSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    this.isOpened = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableSearchBarState createState() => _ExpandableSearchBarState();
}

class _ExpandableSearchBarState extends State<ExpandableSearchBar> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      width: _isExpanded ? MediaQuery.of(context).size.width * 0.8 : 48,
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!_isExpanded) iconButton(),
          if (_isExpanded)
            Expanded(
              child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: Titles.hintSearch,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                  
                  ),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onClear();
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey[400], fontWeight: FontWeight.w100),
                  fillColor: Colors.grey[800],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
