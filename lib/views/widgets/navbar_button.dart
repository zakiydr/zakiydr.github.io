import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class NavbarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const NavbarButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
