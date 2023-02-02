import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_website/ui/screens/home/widgets/custom_navigation_bar.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: ScreenUtil().screenHeight,
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      pinned: true,
      title: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 150.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Zamani.afshar",
                style: theme.textTheme.headlineLarge!.copyWith(
                  fontFamily: 'SassyFrass',
                  fontWeight: FontWeight.bold,
                ),
              ),
              75.horizontalSpace,
              const CustomNavigationBar(),
            ],
          ),
        ),
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
                CircleAvatar(
                  radius: 135.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 130.r,
                    foregroundImage: AssetImage('assets/images/my_picture2.jpg'),
                  ),
                ),
                20.verticalSpace,
                Text(
                  'Mohammad Amin Zamani afshar',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
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
