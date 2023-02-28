import 'package:flutter/material.dart';
import 'package:personal_website/responsive/screen.dart';
import 'package:personal_website/ui/screens/home/widgets/sliver_app_bar/home_sliver_title.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = Screen.of(context);
    return SliverAppBar(
      expandedHeight: screen.height,
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      pinned: true,
      titleSpacing: 0,
      actions: const [SizedBox()],
      title: const Directionality(
        textDirection: TextDirection.ltr,
        child: HomeSliverTitle(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black45,
                child: Image.asset(
                  'assets/images/background1_wblur.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 250,
                    minWidth: 120,
                    minHeight: 120,
                  ),
                  child: CircleAvatar(
                    radius: screen.w(0.5) / 2,
                    backgroundColor: Colors.white12,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: double.infinity,
                      width: double.infinity,
                      child: const CircleAvatar(
                        foregroundImage: AssetImage('assets/images/my_picture2.jpg'),
                      ),
                    ),
                  ),
                ),
                screen.verticalSpace(0.07),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screen.fromMTD(15, 10, 0)),
                  child: FittedBox(
                    child: Text(
                      'Mohammad Amin Zamani afshar',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                screen.verticalSpace(0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screen.fromMTD(screen.w(0.3), 0, 0)),
                  child: FittedBox(
                    child: Text(
                      'Flutter Developer',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
