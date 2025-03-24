import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';

class ContactIcon extends StatelessWidget {
  final String? icon;
  final String? link;

  const ContactIcon({super.key, this.icon, this.link});

  Future<void> _launchUrl() async {
    if (link != null) {
      final Uri url = Uri.parse(link!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: _launchUrl,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset(
            icon ?? '',
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
