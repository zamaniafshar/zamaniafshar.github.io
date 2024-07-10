import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/animated_title_text.dart';
import 'package:personal_website/ui/my_services/service_container.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;

    final isSmallScreen = screen.width <= kMinLargeTabletWidth;
    final isMediumScreen = screen.width <= kMinMediumDesktopWidth;
    Widget layout;

    if (isSmallScreen) {
      layout = const SmallScreenLayout();
    } else if (isMediumScreen) {
      layout = const MediumScreenLayout();
    } else {
      layout = const LargeScreenLayout();
    }

    return Padding(
      padding: screen.contentPadding,
      child: Column(
        children: [
          AnimatedTitleText(
            title: localization.services,
          ),
          const SizedBox(height: 30),
          layout,
        ],
      ),
    );
  }
}

class LargeScreenLayout extends StatelessWidget {
  const LargeScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: WebDevelopment(),
          ),
          Expanded(
            child: MobileDevelopment(),
          ),
          Expanded(
            child: DesktopDevelopment(),
          ),
        ],
      ),
    );
  }
}

class MediumScreenLayout extends StatelessWidget {
  const MediumScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: WebDevelopment(),
              ),
              Expanded(
                child: MobileDevelopment(),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: DesktopDevelopment(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class SmallScreenLayout extends StatelessWidget {
  const SmallScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WebDevelopment(),
        MobileDevelopment(),
        DesktopDevelopment(),
      ],
    );
  }
}

class DesktopDevelopment extends StatelessWidget {
  const DesktopDevelopment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ServiceContainer(
      icon: Icons.desktop_windows_outlined,
      title: localization.desktopDevelopment,
      description: localization.desktopDevelopmentDescription,
    );
  }
}

class MobileDevelopment extends StatelessWidget {
  const MobileDevelopment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ServiceContainer(
      icon: Icons.phone_android,
      title: localization.mobileDevelopment,
      description: localization.mobileDevelopmentDescription,
    );
  }
}

class WebDevelopment extends StatelessWidget {
  const WebDevelopment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ServiceContainer(
      icon: Icons.code,
      title: localization.webDevelopment,
      description: localization.webDevelopmentDescription,
    );
  }
}
