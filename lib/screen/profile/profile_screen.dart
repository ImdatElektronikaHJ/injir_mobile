import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajir/screen/profile/local_widgets/profile_app_bar.dart';
import 'package:tajir/theme/svg_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
      const ProfileAppBar(),
      SliverToBoxAdapter(
        child: Column(
          children: [
            ListTile(
              leading: SvgPicture.asset(
                SvgImages.person,
              ),
              title: Text('Edit Profile',
                  style: Theme.of(context).textTheme.subtitle2!),
              trailing: SvgPicture.asset(
                SvgImages.arrowright,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                SvgImages.local,
              ),
              title: Text('Address',
                  style: Theme.of(context).textTheme.subtitle2!),
              trailing: SvgPicture.asset(
                SvgImages.arrowright,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                SvgImages.clock,
              ),
              title: Text('Order History',
                  style: Theme.of(context).textTheme.subtitle2!),
              trailing: SvgPicture.asset(
                SvgImages.arrowright,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                SvgImages.lang,
              ),
              title: Text('Language',
                  style: Theme.of(context).textTheme.subtitle2!),
              trailing: SvgPicture.asset(
                SvgImages.arrowright,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
