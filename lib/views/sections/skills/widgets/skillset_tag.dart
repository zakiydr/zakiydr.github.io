// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class SkillsetTag extends StatefulWidget {
  final String? tagIcon;
  final String? tagName;
  const SkillsetTag({
    super.key,
    this.tagIcon,
    this.tagName,
  });

  @override
  State<SkillsetTag> createState() => _SkillsetTagState();
}

class _SkillsetTagState extends State<SkillsetTag> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {},
      mouseCursor: MouseCursor.defer,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
        decoration: BoxDecoration(
          color: isHovered ? Constants.deepTeal : Colors.white,
          borderRadius: BorderRadius.circular(32),
          // border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Image.asset(
                widget.tagIcon ?? '',
                width: 25,
              ),
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isHovered ? Colors.white : Constants.deepTeal) ??
                    TextStyle(),
                child: Text(widget.tagName ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
