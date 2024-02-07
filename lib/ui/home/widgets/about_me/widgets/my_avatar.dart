import 'package:flutter/material.dart';
import 'package:personal_website/config/constants/constants.dart';
import 'package:personal_website/common/responsive/responsive.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = Screen.of(context);

    return SizedBox.square(
      dimension: screen.fromMTD(200, 250, 300),
      child: const PhysicalModel(
        shape: BoxShape.circle,
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            foregroundImage: NetworkImage(kProfileImageUrl),
          ),
        ),
      ),
    );
  }
}
