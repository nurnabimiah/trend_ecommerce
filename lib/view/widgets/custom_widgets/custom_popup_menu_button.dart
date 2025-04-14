import 'package:flutter/material.dart';

import '../../../utils/global/size_box.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<PopupMenuItemData> menuItems;
  final double popupMenuHeight;
  final double popupMenuElevation;
  final Color tableActionIconColor;
  final double tableActionIconSize;
  final IconData mainButtonIcon;

   const CustomPopupMenuButton({
    super.key,
    required this.menuItems,
    this.popupMenuHeight = 40,
    this.popupMenuElevation = 1.5,
    this.tableActionIconColor = const Color(0xFF480d0e),
    this.tableActionIconSize = 20,
    this.mainButtonIcon = Icons.more_vert_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      elevation: popupMenuElevation,
      child: SizedBox(
        child: Center(
          child: Icon(
            mainButtonIcon,
            color: tableActionIconColor,
            size: tableActionIconSize,
          ),
        ),
      ),
      onSelected: (String choice) {
        final selectedItem = menuItems.firstWhere((item) => item.value == choice);
        selectedItem.onTap();
      },
      itemBuilder: (BuildContext context) {
        return menuItems
            .map(
              (item) => PopupMenuItem<String>(
            value: item.value,
            height: popupMenuHeight,
            child: Row(
              children: [
                Icon(item.icon, size: 20),
                szW7(),
                Text(item.label, style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        )
            .toList();
      },
    );
  }
}

class PopupMenuItemData {
  final String value;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  PopupMenuItemData({
    required this.value,
    required this.label,
    required this.icon,
    required this.onTap,
  });
}
