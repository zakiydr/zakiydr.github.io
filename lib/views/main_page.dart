import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/views/sections/home/home_section.dart';
import 'package:web_portfolio/views/widgets/contact_icon.dart';
import 'package:web_portfolio/views/widgets/footer.dart';
import 'package:web_portfolio/views/widgets/navbar_button.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../constants/constants.dart';
import 'sections/projects/projects_section.dart';
import 'sections/skills/skills_section.dart';
import 'widgets/burger_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static final homeSectionKey = GlobalKey();
  static final projectsSectionKey = GlobalKey();
  static final skillsSectionKey = GlobalKey();
  static final contactSectionKey = GlobalKey();

  static void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
      // appBar: _buildAppBar(context),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          DynMouseScroll(
            durationMS: 150,
            builder: (BuildContext context, ScrollController controller,
                ScrollPhysics physics) {
              return ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: RawScrollbar(
                  padding: EdgeInsets.only(right: 2),
                  controller: controller,
                  thumbColor: Constants.oceanBlue,
                  trackColor: Constants.oceanBlue,
                  interactive: true,
                  radius: Radius.circular(24),
                  fadeDuration: Duration(seconds: 1),
                  thickness: 8,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: _buildBody(context),
                    physics: physics,
                  ),
                ),
              );
            },
          ),
          _buildNavbar(context),
        ],
      ),
    );
  }

  Widget _buildNavbar(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    final navItems = [
      {'text': 'Home', 'onPressed': () => scrollToSection(homeSectionKey)},
      {
        'text': 'Projects',
        'onPressed': () => scrollToSection(projectsSectionKey)
      },
      {'text': 'Skills', 'onPressed': () => scrollToSection(skillsSectionKey)},
      {
        'text': 'Contacts',
        'onPressed': () => scrollToSection(contactSectionKey)
      },
    ];

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width * .8,
      height: 50,
      decoration: BoxDecoration(
        color: Constants.deepTeal.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Image.asset(
                  Constants.profileLogo,
                  width: 25,
                  color: Colors.white,
                ),
                Image.asset(
                  Constants.profileName,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          if (!isMobile)
            ...navItems.map(
              (item) => NavbarButton(
                onPressed: item['onPressed'] as VoidCallback,
                text: item['text'] as String,
              ),
            )
          else
            BurgerMenu(items: navItems),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        HomeSection(
          key: homeSectionKey,
        ),
        ProjectsSection(
          key: projectsSectionKey,
        ),
        SkillsSection(
          key: skillsSectionKey,
        ),
        Footer(
          key: contactSectionKey,
        ),
      ],
    );
  }
}
