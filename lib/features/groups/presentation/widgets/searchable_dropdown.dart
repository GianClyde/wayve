import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  final ValueChanged<String>? onSelected;
  final List<String>? items;
  final String label;

  const SearchableDropdown({
    super.key,
    this.onSelected,
    this.items,
    this.label = 'Select Member',
  });

  @override
  State<SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  final TextEditingController _controller = TextEditingController();

  static const List<String> _defaultNames = [
    'Alex Rivera',
    'Chris Evans',
    'Diana Prince',
    'Emma Watson',
    'Jordan Lee',
    'Morgan Taylor',
    'Sam Wilson',
    'Taylor Swift',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.items ?? _defaultNames;

    return DropdownMenu<String>(
      expandedInsets: EdgeInsets.zero,
      controller: _controller,
      enableFilter: true, // Enables typing into the field to search
      requestFocusOnTap: true,
      leadingIcon: const Icon(Icons.person_search_outlined),
      label: Text(widget.label),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(),
      ),
      onSelected: (String? value) {
        if (value != null && value.isNotEmpty) {
          widget.onSelected?.call(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _controller.clear();
          });
        }
      },
      dropdownMenuEntries: entries.map((name) {
        return DropdownMenuEntry<String>(value: name, label: name);
      }).toList(),
    );
  }
}
