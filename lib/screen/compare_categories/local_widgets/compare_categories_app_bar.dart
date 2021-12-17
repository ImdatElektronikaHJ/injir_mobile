import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareAppBar extends StatelessWidget {
  final Function? onMenuTapped;
  const CompareAppBar({Key? key, this.onMenuTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: AppDimension.elevationAppBarElevation,
      centerTitle: false,
      title: Text(
        'Compare',
        style: Theme.of(context).textTheme.headline6,
      ),
      floating: true,
    );
  }
}
