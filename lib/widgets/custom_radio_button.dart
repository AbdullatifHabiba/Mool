import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<Map<String, String>?> onChanged;

  const CustomRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Extract flag and name from the title
        final flag = title.split(' ')[0];
        final name = title.split(' ').sublist(1).join(' ');

        // Call the onChanged callback with the correct map structure
        onChanged({'flag': flag, 'name': name});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(
              groupValue == value
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: groupValue == value ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}