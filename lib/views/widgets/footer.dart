import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/constants/constants.dart';
import 'package:web_portfolio/views/widgets/contact_icon.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Constants.deepTeal,
      width: double.infinity,
      child: Flex(
        direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !isSmallScreen ? _buildCredit(context) : _buildContacts(),
          !isSmallScreen ? _buildContacts() : _buildCredit(context),
        ],
      ),
    );
  }

  Widget _buildCredit(BuildContext context) {
    return SelectableText(
      "2025 \u00a9 Zakiyuddin Rahman",
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.white),
    );
  }

  Wrap _buildContacts() {
    return Wrap(
      children: const [
        ContactIcon(
          icon: Constants.mailIcon,
          link: 'mailto:zakiyuddinr@gmail.com',
        ),
        ContactIcon(
          icon: Constants.githubIcon,
          link: 'https://github.com/zakiydr',
        ),
        ContactIcon(
          icon: Constants.linkedinIcon,
          link: 'https://www.linkedin.com/in/zakiyuddinr/',
        ),
      ],
    );
  }
}
