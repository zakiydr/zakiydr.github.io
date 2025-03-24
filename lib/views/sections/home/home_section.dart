import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/views/widgets/sections_layout.dart';

import '../../../constants/constants.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    double getTextScale() {
      if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)) {
        return .8;
      } else if (ResponsiveBreakpoints.of(context).smallerThan(TABLET)) {
        return .4;
      }
      return 1.0;
    }

    return SectionsLayout(
      backgroundImage: Stack(
        children: [
          Image.asset(
            Constants.bgImage,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Zakiyuddin Rahman',
                
                textScaler: TextScaler.linear(getTextScale()),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                textAlign: TextAlign.center,
                'Software Developer',
                textScaler: TextScaler.linear(getTextScale()),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(getTextScale()),
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                    children: [
                      TextSpan(
                        text:
                            'A passionate software developer highly concerned with excellent user experiences (UX). I specialize in ',
                        // style: Theme.of(context).textTheme.displaySmall,
                      ),
                      TextSpan(
                          text: 'Android Development ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ResponsiveBreakpoints.of(context)
                                    .largerThan(TABLET)
                                ? Constants.deepTeal
                                : Constants.softSky,
                          )),
                      TextSpan(
                        text: 'using ',
                      ),
                      TextSpan(
                        text: 'Flutter',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ResponsiveBreakpoints.of(context)
                                  .largerThan(TABLET)
                              ? Constants.deepTeal
                              : Constants.softSky,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
