import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/constants/constants.dart';

class ProjectPlatformLink extends StatefulWidget {
  final String? link;
  final String? icon;
  final String? hoverIcon; // Renamed from backIcon to hoverIcon
  const ProjectPlatformLink({
    super.key,
    this.link,
    this.icon,
    this.hoverIcon, // Parameter renamed
  });

  @override
  State<ProjectPlatformLink> createState() => _ProjectPlatformLinkState();
}

class _ProjectPlatformLinkState extends State<ProjectPlatformLink>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovered = value;
        });

        if (value) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      onTap: () async {
        final url = Uri.parse(widget.link ?? '');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final showFrontSide = _animation.value <= 0.5;

            final displayedIcon = (showFrontSide || widget.hoverIcon == null)
                ? widget.icon
                : widget.hoverIcon;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_animation.value * 3.14),
              child: Transform.scale(
                scaleX: showFrontSide ? 1.0 : -1.0,
                child: Image.asset(
                  displayedIcon ?? '',
                  width: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
