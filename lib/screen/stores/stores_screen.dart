import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/svg_icons.dart';

import 'local_widgets/stories_item_widgets.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
            leading: Text(
              'Магазины',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            title: Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                SvgImages.filter
              ),
            ),
            trailing: SvgPicture.asset(
                SvgImages.katalog
              ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 2 / 2.1,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return const StoriesItemScreen();
          },childCount: 16),
        ),
      ],
    );
  }
}
