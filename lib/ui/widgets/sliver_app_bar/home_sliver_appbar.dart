import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/common/constants/assets_paths.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/config/theme/text_theme.dart';
import 'package:personal_website/ui/widgets/custom_elevated_button.dart';
import 'package:personal_website/ui/widgets/sliver_app_bar/widgets/home_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = Screen.of(context);
    final localization = AppLocalizations.of(context)!;

    return SliverAppBar(
      expandedHeight: screen.height,
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      pinned: true,
      titleSpacing: 0,
      actions: const [SizedBox()],
      title: const Directionality(
        textDirection: TextDirection.ltr,
        child: HomeAppBar(),
      ),
      flexibleSpace: WelcomeWidget(),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.merge(getWhiteTextTheme),
      ),
      child: Builder(builder: (context) {
        final theme = Theme.of(context);
        final screen = Screen.of(context);
        final localization = AppLocalizations.of(context)!;
        return FlexibleSpaceBar(
          background: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(kHomeBackgroundImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ColoredBox(
                    color: Colors.black45,
                  ),
                ),
              ),
              Positioned.fill(
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
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    SizedBox(height: 20),
                    Text(
                      localization.homeJobTitle,
                      style: screen.fromMTD(
                        theme.textTheme.titleLarge,
                        theme.textTheme.headlineSmall,
                        theme.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                      ),
                      foregroundColor: theme.primaryColorLight,
                      backgroundColor: Colors.black12,
                      elevation: 0,
                      child: Text(localization.hireMe),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
