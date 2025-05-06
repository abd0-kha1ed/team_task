import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text('Select $label'),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        onChanged: onChanged,
        items:
            items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
      ),
    );
  }
}
