import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/theme/app_theme_service.dart';

class MainScreen extends StatelessWidget {
  final AppThemeService themeService = AppThemeService();
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Test'),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _onColorChange(),
                    child: const Text('Сменить тему')),
              ],
            ),
          )
        ],
      ),
    );
  }

  _onColorChange() {
    themeService.switchTheme();
  }
}
