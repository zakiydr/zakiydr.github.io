import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/views/sections/skills/widgets/skillset_tag.dart';
import 'package:web_portfolio/views/widgets/sections_layout.dart';
import 'package:web_portfolio/views/widgets/sections_title.dart';

import '../../../constants/constants.dart';
import '../../widgets/footer.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionsLayout(
      child: Column(
        children: [
          SectionTitle(
            text: 'What I Bring to the Table',
          ),
          SizedBox(height: 40), // Use explicit spacing
          _buildSkillsGrid(context),
          SizedBox(height: 40), // Use explicit spacing
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    // Determine if we're on a large screen
    final isLargeScreen = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    // Use a responsive layout approach
    return isLargeScreen
        ? _buildHorizontalLayout(context)
        : _buildVerticalLayout(context);
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SkillsCategory(
            title: 'Frontend',
            children: _getFrontendSkills(),
          ),
        ),
        Expanded(
          child: SkillsCategory(
            title: 'Backend',
            children: _getBackendSkills(),
          ),
        ),
        Expanded(
          child: SkillsCategory(
            title: 'Other',
            children: _getOtherSkills(),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      children: [
        SkillsCategory(
          title: 'Frontend',
          children: _getFrontendSkills(),
        ),
        SizedBox(height: 20),
        SkillsCategory(
          title: 'Backend',
          children: _getBackendSkills(),
        ),
        SizedBox(height: 20),
        SkillsCategory(
          title: 'Other',
          children: _getOtherSkills(),
        ),
      ],
    );
  }

  // Helper methods to keep the code organized
  List<Widget> _getFrontendSkills() {
    return [
      SkillsetTag(
        tagIcon: Constants.htmlIcon,
        tagName: 'HTML',
      ),
      SkillsetTag(
        tagIcon: Constants.cssIcon,
        tagName: 'CSS',
      ),
      SkillsetTag(
        tagIcon: Constants.jsIcon,
        tagName: 'JavaScript',
      ),
      SkillsetTag(
        tagIcon: Constants.flutterIcon,
        tagName: 'Flutter',
      ),
    ];
  }

  List<Widget> _getBackendSkills() {
    return [
      SkillsetTag(
        tagIcon: Constants.nodejsIcon,
        tagName: 'Node JS',
      ),
      SkillsetTag(
        tagIcon: Constants.pythonIcon,
        tagName: 'Python',
      ),
      SkillsetTag(
        tagIcon: Constants.djangoIcon,
        tagName: 'Django',
      ),
      SkillsetTag(
        tagIcon: Constants.laravelIcon,
        tagName: 'Laravel',
      ),
      SkillsetTag(
        tagIcon: Constants.sqlIcon,
        tagName: 'SQL',
      ),
    ];
  }

  List<Widget> _getOtherSkills() {
    return [
      SkillsetTag(
        tagIcon: Constants.gitIcon,
        tagName: 'Git',
      ),
      SkillsetTag(
        tagIcon: Constants.trelloIcon,
        tagName: 'Trello',
      ),
      SkillsetTag(
        tagIcon: Constants.pandasIcon,
        tagName: 'Pandas',
      ),
    ];
  }
}

class SkillsCategory extends StatelessWidget {
  final String? title;
  final List<Widget>? children;

  const SkillsCategory({
    this.title,
    this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // Remove any constraints that could cause overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          SizedBox(
              height: 20), // Fixed spacing instead of using spacing property
          if (children != null && children!.isNotEmpty)
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: children!,
            ),
        ],
      ),
    );
  }
}
