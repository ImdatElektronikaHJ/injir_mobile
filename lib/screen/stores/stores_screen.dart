import 'package:flutter/material.dart';
import 'package:tajir/screen/stores/local_widgets/stores_app_bar.dart';

import 'local_widgets/stores_item_screen.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const StoresAppBar(),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 2 / 2.1,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return const StoresItemScreen();
          },childCount: 16),
        ),
      ],
    );
  }
}
