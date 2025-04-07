import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String? text;
  const SectionTitle({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      textAlign: TextAlign.center,
      text ?? '',
      style: Theme.of(context)
          .textTheme
          .displayMedium
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
