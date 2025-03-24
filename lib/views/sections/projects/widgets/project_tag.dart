import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class ProjectTag extends StatefulWidget {
  final String? tagIcon;
  final String? tagLabel;

  const ProjectTag({
    super.key,
    this.tagIcon,
    this.tagLabel,
  });

  @override
  State<ProjectTag> createState() => _ProjectTagState();
}

class _ProjectTagState extends State<ProjectTag> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      mouseCursor: MouseCursor.defer,
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 200),
        scale: isHovered ? 1.1 : 1.0,
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: isHovered ? Constants.vibrantCyan : Constants.deepTeal,
            borderRadius: BorderRadius.circular(32),
          ),
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
                        color: isHovered ? Constants.deepTeal : Colors.white) ??
                    TextStyle(),
                child: Text(widget.tagLabel ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
