import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/ui/widgets/animated_title_text.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;

    final webDevelopment = ServiceContainer(
      icon: Icons.code,
      title: localization.webDevelopment,
      description: localization.webDevelopmentDescription,
    );
    final mobileDevelopment = ServiceContainer(
      icon: Icons.phone_android,
      title: localization.mobileDevelopment,
      description: localization.mobileDevelopmentDescription,
    );

    final desktopDevelopment = ServiceContainer(
      icon: Icons.desktop_windows_outlined,
      title: localization.desktopDevelopment,
      description: localization.desktopDevelopmentDescription,
    );

    Widget child;

    if (screen.width <= kMinLargeTabletWidth) {
      child = Column(
        children: [
          webDevelopment,
          mobileDevelopment,
          desktopDevelopment,
        ],
      );
    } else if (screen.width <= kMinMediumDesktopWidth) {
      child = Column(
        children: [
          Row(
            children: [
              Expanded(child: webDevelopment),
              Expanded(child: mobileDevelopment),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 4,
                child: desktopDevelopment,
              ),
              const Spacer(),
            ],
          ),
        ],
      );
    } else {
      child = Row(
        children: [
          Expanded(child: webDevelopment),
          Expanded(child: mobileDevelopment),
          Expanded(child: desktopDevelopment),
        ],
      );
    }

    return Padding(
      padding: screen.contentPadding,
      child: Column(
        children: [
          AnimatedTitleText(
            title: localization.services,
          ),
          screen.verticalSpace(5),
          child,
        ],
      ),
    );
  }
}

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({
    Key? key,
    required this.description,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String description;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = Screen.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: CustomPaint(
        foregroundPainter: ServiceContainerBorderPainter(theme.primaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.primaryColor),
                ),
                child: Icon(
                  icon,
                  color: theme.primaryColor,
                  size: screen.fromMTD(30, 40, 50),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                description,
                style: theme.textTheme.titleMedium,
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceContainerBorderPainter extends CustomPainter {
  const ServiceContainerBorderPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final area = size.height * 0.3;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke;

    final topLeftBorder = Path()
      ..moveTo(0, area)
      ..lineTo(0, 0)
      ..lineTo(area, 0);

    final bottomRightBorder = Path()
      ..moveTo(size.width - area, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - area);

    canvas.drawPath(topLeftBorder, paint);
    canvas.drawPath(bottomRightBorder, paint);
  }

  @override
  bool shouldRepaint(covariant ServiceContainerBorderPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
