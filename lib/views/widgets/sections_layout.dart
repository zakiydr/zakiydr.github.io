// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../constants/constants.dart';

class SectionsLayout extends StatelessWidget {
  final Widget child;
  final Widget? backgroundImage;
  final Color? backgroundColor;
  const SectionsLayout({
    Key? key,
    required this.child,
    this.backgroundImage,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildFirstLayer(),
        _buildSecondLayer(context),
      ],
    );
  }

  Widget _buildSecondLayer(BuildContext context) {
    EdgeInsetsGeometry getPadding(double horizontal, double vertical) {
      if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)) {
        return EdgeInsets.symmetric(
          horizontal: horizontal * .5,
          vertical: vertical * .5,
        );
      } else if (ResponsiveBreakpoints.of(context).smallerThan(TABLET)) {
        return EdgeInsets.symmetric(
          horizontal: horizontal * .4,
          vertical: vertical * .4,
        );
      }
      return EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      );
    }

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
      padding: getPadding(80, 40),
      width: MediaQuery.sizeOf(context).width,
      color: backgroundColor,
      child: child,
    );
  }

  Widget _buildFirstLayer() => backgroundImage ?? SizedBox.shrink();
}
