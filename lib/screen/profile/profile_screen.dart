import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajir/theme/svg_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: SvgPicture.asset(
            SvgImages.login,
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            SvgImages.person,
          ),
          title: const Text('Edit Profile',
              style: TextStyle(
                fontSize: 14,
              )),
          trailing: SvgPicture.asset(
            SvgImages.arrowright,
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            SvgImages.local,
          ),
          title: const Text('Address',
              style: TextStyle(
                fontSize: 14,
              )),
          trailing: SvgPicture.asset(
            SvgImages.arrowright,
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            SvgImages.clock,
          ),
          title: const Text('Order History',
              style: TextStyle(
                fontSize: 14,
              )),
          trailing: SvgPicture.asset(
            SvgImages.arrowright,
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            SvgImages.lang,
          ),
          title: const Text('Language',
              style: TextStyle(
                fontSize: 14,
              )),
          trailing: SvgPicture.asset(
            SvgImages.arrowright,
          ),
        ),
      ],
    );
  }
}
