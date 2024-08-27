import 'package:flutter/material.dart';
class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({super.key, 
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: groupValue == value
                    ? Colors.black
                    : Colors.transparent,
                border: Border.all(
                  color: groupValue == value ? Colors.black : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: groupValue == value
                  ? const Icon(
                      Icons.check,
                      size: 20.0,
                      color: Colors.white,
                    )
                  : const SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}