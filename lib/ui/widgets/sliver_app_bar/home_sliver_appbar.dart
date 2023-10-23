import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/common/constants/assets_paths.dart';
import 'package:personal_website/common/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';
import 'package:personal_website/config/theme/text_theme.dart';
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screen.adaptive(mobile: screen.w(30), defaultValue: 0)!,
                      ),
                      child: FittedBox(
                        child: Text(
                          localization.homeWelcome,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    screen.verticalSpace(2),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screen.fromMTD(screen.w(5), screen.w(10), 0)),
                      child: FittedBox(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: const Duration(seconds: 2),
                          animatedTexts: [
                            TypewriterAnimatedText(
                              localization.myName,
                              textStyle: theme.textTheme.displayMedium,
                              speed: const Duration(milliseconds: 100),
                              cursor: '|',
                            ),
                          ],
                        ),
                      ),
                    ),
                    screen.verticalSpace(2),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screen.adaptive(mobile: screen.w(30), defaultValue: 0)!,
                      ),
                      child: FittedBox(
                        child: Text(
                          localization.homeJobTitle,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    screen.verticalSpace(2),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: theme.primaryColorLight,
                        backgroundColor: Colors.black12,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                            color: theme.primaryColor,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      ),
                      child: Text(
                        localization.hireMe,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.primaryColorLight,
                        ),
                      ),
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
