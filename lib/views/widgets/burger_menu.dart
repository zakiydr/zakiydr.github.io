import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class BurgerMenu extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const BurgerMenu({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<BurgerMenu> createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Constants.oceanBlue.withValues(alpha: .5),
      offset: Offset(-5, 20),
      icon: Icon(Icons.menu, color: Colors.white),
      position: PopupMenuPosition.under,
      onOpened: () => setState(() => _isOpen = true),
      onCanceled: () => setState(() => _isOpen = false),
      itemBuilder: (context) {
        return widget.items.map((item) {
          return PopupMenuItem(
            padding: EdgeInsets.zero,
            child: InkWell(
              onTap: () {
                (item['onPressed'] as VoidCallback)();
                // Don't close the menu automatically
                // The user needs to close it manually
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                height: kMinInteractiveDimension,
                child: Text(
                  item['text'] as String,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
