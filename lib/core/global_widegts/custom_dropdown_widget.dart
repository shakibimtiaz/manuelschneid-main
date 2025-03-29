import 'package:flutter/material.dart';
import 'package:manuelschneid/core/style/global_text_style.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final TextEditingController controller;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(
          0xFFFFFFFF,
        ).withValues(alpha: 0.04), // Dropdown background color
      ),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        items:
            widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: globalTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white, // Items text color
                  ),
                ),
              );
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue;
            widget.controller.text = newValue ?? '';
          });
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: globalTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.5),
          ),
          filled: true,
          fillColor: const Color(
            0xFFFFFFFF,
          ).withValues(alpha: 0.04), // Main fill color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
