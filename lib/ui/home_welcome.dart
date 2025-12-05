import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_website/provider/current_tag_notifier.dart';
import 'package:personal_website/responsive/responsive.dart';
import 'package:personal_website/config/constants/assets_paths.dart';
import 'package:personal_website/config/l10n/app_localizations.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/config/constants/home_items_tags.dart';
import 'package:personal_website/config/theme/text_theme.dart';
import 'package:personal_website/data/url_handler.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.merge(getWhiteTextTheme),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final screen = Screen.of(context);
          final localization = AppLocalizations.of(context)!;

          return Container(
            height: screen.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kHomeBackgroundImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: ColoredBox(
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.homeWelcome,
                    style: screen.fromMTD(
                      theme.textTheme.titleLarge,
                      theme.textTheme.headlineSmall,
                      theme.textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FittedBox(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: const Duration(seconds: 2),
                        animatedTexts: [
                          TypewriterAnimatedText(
                            localization.myName,
                            textStyle: screen.fromMTD(
                              theme.textTheme.headlineMedium,
                              theme.textTheme.displaySmall,
                              theme.textTheme.displayMedium,
                            ),
                            speed: const Duration(milliseconds: 100),
                            cursor: '|',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localization.homeJobTitle,
                    style: screen.fromMTD(
                      theme.textTheme.titleLarge,
                      theme.textTheme.headlineSmall,
                      theme.textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    onPressed: () {
                      context.read<CurrentTagNotifier>().setTag(kHomeContactMeItemTag);
                    },
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      color: theme.primaryColor,
                    ),
                    foregroundColor: theme.primaryColorLight,
                    backgroundColor: Colors.black12,
                    elevation: 0,
                    child: Text(localization.hireMe),
                  ),
                  const SizedBox(height: 60),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _CircularLinkButton(
                        link: kMyTelegramUrl,
                        svgPath: kTelegramSvgPath,
                      ),
                      _CircularLinkButton(
                        link: kMyGithubUrl,
                        svgPath: kGithubSvgPath,
                      ),
                      _CircularLinkButton(
                        link: kMyLinkedinUrl,
                        svgPath: kLinkedinSvgPath,
                      ),
                      _CircularLinkButton(
                        link: kMyInstagramUrl,
                        svgPath: kInstagramSvgPath,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CircularLinkButton extends StatelessWidget {
  const _CircularLinkButton({
    required this.link,
    required this.svgPath,
  });

  final String link;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => launchUrlOnWebBrowser(link),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(20),
      ),
      child: SvgPicture.asset(
        svgPath,
        height: 18,
        width: 18,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
