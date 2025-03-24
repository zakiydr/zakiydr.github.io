import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/views/sections/projects/widgets/project_platform_link.dart';
import 'package:web_portfolio/views/sections/projects/widgets/project_tag.dart';
import 'package:web_portfolio/views/widgets/sections_layout.dart';
import 'package:web_portfolio/views/widgets/sections_title.dart';

import '../../../constants/constants.dart';
import 'widgets/project_item.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionsLayout(
      backgroundColor: Constants.softSky,
      child: _buildSectionsContent(context),
    );
  }

  Widget _buildSectionsContent(BuildContext context) {
    return Column(
      spacing: 100,
      children: [
        SectionTitle(text: 'Projects'),
        Container(
          child: Column(
            spacing: 100,
            children: [
              ProjectItem(
                image: Constants.projectKGImage,
                title: 'Kampus Gratis',
                detail:
                    "A comprehensive Learning Management System (LMS) designed to deliver educational content in alignment with the MSIB program. The app aims to expand the company's reach beyond its initial focus on consulting for company management. As the name 'Kampus Gratis' suggests, the program curriculum are based on college subjects.",
                platformButtons: [
                  ProjectPlatformLink(
                    icon: Constants.gPlayStoreIcon,
                    link: Constants.kgPlayStoreLink,
                  ),
                ],
                tagList: [
                  ProjectTag(
                    tagIcon: Constants.flutterIcon,
                    tagLabel: 'Flutter',
                  ),
                ],
              ),
              ProjectItem(
                isInverted: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                    ? true
                    : false,
                image: Constants.projectInvoiceImage,
                title: 'Invoice Generation System',
                detail:
                    'Mobile Apps as the capstone project of Flutter Developer training. A single app that capable to manage, track, and generate invoice transaction.',
                platformButtons: [
                  ProjectPlatformLink(
                    icon: Constants.githubIcon,
                    link: Constants.invoiceGithubLink,
                  ),
                ],
                tagList: [
                  ProjectTag(
                    tagIcon: Constants.flutterIcon,
                    tagLabel: 'Flutter',
                  ),
                ],
              ),
              ProjectItem(
                image: Constants.projectGSImage,
                alignment: Alignment.center,
                title: 'Scholar Publication Information System',
                detail:
                    'This final year project marks my first venture into full-stack development. It assists scholars in tracking their academic journals, publications, and citations. Utilizing the Scholarly library, a Python-based tool for scraping Google Scholar, the app efficiently displays data retrieved from Google Scholar. The cross-platform application is accessible on both web and Android.',
                platformButtons: [
                  ProjectPlatformLink(
                    icon: !ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? Constants.flutterIcon
                        : Constants.githubIcon,
                    hoverIcon: Constants.flutterIcon,
                    link: Constants.gsGithubLink,
                  ),
                  ProjectPlatformLink(
                    icon: !ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? Constants.pythonIcon
                        : Constants.githubIcon,
                    hoverIcon: Constants.pythonIcon,
                    link: Constants.gsBackendGithubLink,
                  ),
                ],
                tagList: [
                  ProjectTag(
                    tagIcon: Constants.flutterIcon,
                    tagLabel: 'Flutter',
                  ),
                  ProjectTag(
                    tagIcon: Constants.djangoIcon,
                    tagLabel: 'Django',
                  ),
                  ProjectTag(
                    tagIcon: Constants.pythonIcon,
                    tagLabel: 'Python',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
