import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_website/ui/screens/home/widgets/custom_navigation_bar.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: ScreenUtil().screenHeight,
      backgroundColor: Colors.black,
      centerTitle: true,
      pinned: true,
      title: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 150.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Zamani.afshar",
              style: TextStyle(
                fontFamily: 'SassyFrass',
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            75.horizontalSpace,
            CustomNavigationBar(),
          ],
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w300,
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
