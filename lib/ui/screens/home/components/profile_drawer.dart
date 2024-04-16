import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/core/constants/assets.dart';
import 'package:task1/core/constants/text_styles.dart';

class ProfleDrawer extends StatelessWidget {
  const ProfleDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
              child: const CircleAvatar(
                backgroundImage: AssetImage('${staticPath}/profile.jpg'),
                radius: 50,
              ),
            ),
            Text('Jessica', style: boldTitleWhite),
            SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',
              style: regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
