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
                  constraints: BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 250,
                    minWidth: 70,
                    minHeight: 70,
                  ),
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: double.infinity,
                      width: double.infinity,
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/my_picture2.jpg'),
                      ),
                    ),
                  ),
                ),
                screen.verticalSpace(0.15),
                Text(
                  'Mohammad Amin Zamani afshar',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                screen.verticalSpace(0.1),
                Text(
                  'Flutter Developer',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
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
