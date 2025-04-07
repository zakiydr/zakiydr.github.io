// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectItem extends StatelessWidget {
  final bool isInverted;
  final AlignmentGeometry? alignment;
  final String? image;
  final String? title;
  final List<Widget>? platformButtons;
  final String? detail;
  final List<Widget>? tagList;

  const ProjectItem({
    Key? key,
    this.isInverted = false,
    this.alignment,
    this.image,
    this.title,
    this.platformButtons,
    this.detail,
    this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return LayoutBuilder(builder: (context, constraints) {
      return isLargeScreen
          ? _buildHorizontalLayout(context)
          : _buildVerticalLayout(context);
    });
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child:
              isInverted ? _buildProjectDetail(context) : _buildProjectImage(),
        ),
        SizedBox(width: 48),
        Expanded(
          child:
              isInverted ? _buildProjectImage() : _buildProjectDetail(context),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isInverted ? _buildProjectDetail(context) : _buildProjectImage(),
        SizedBox(height: 24),
        isInverted ? _buildProjectImage() : _buildProjectDetail(context),
      ],
    );
  }

  Widget _buildProjectImage() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 18 / 9,
          child: Image(
            image: AssetImage(
              image ?? '',
            ),
            errorBuilder: (context, error, stackTrace) {
              return SizedBox.shrink();
            },
            fit: BoxFit.cover,
            alignment: alignment ?? Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          if (platformButtons != null && platformButtons!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Wrap(
                spacing: 10,
                children: platformButtons!,
              ),
            ),
          if (detail != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SelectableText(
                textAlign: TextAlign.justify,
                detail!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          if (tagList != null && tagList!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tagList!,
              ),
            ),
        ],
      ),
    );
  }
}
