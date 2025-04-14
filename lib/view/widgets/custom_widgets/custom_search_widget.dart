import 'package:flutter/material.dart';

import '../../../utils/global/debounce_class.dart';
import '../../../utils/theme/app_colors/basic_color.dart';
import 'custom_text_form_field.dart';

class CustomSearchWidget extends StatefulWidget {
  final Function(String) onSearch; // Single function for both text and fetching

  const CustomSearchWidget({
    required this.onSearch,
    super.key,
  });

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  var searchController = TextEditingController();
  var searchFocusNode = FocusNode();
  late VoidCallback _debouncedCallData;

  void _onTextChanged(String text) {
    _debouncedCallData(); // Call debounced function
  }

  void _callData() {
    widget.onSearch(searchController.text.trim()); // Pass text and fetch data
  }

  @override
  void initState() {
    _debouncedCallData = DebounceClass.debounce(_callData, const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: searchController,
      focusNode: searchFocusNode,
      hintText: "Search..",
      contentPaddingVertical: 8,
      boarderRadius: 20,
      focusBoarderColor: whiteOnly,
      enabledBoarderColor: whiteOnly,
      fillColor: whiteOnly,
      onChanged: _onTextChanged, // Pass function directly
    );
  }
}
