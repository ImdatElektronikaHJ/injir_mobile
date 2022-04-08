import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/order_history/local_widgets/order_history_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/svg_icons.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: CustomScrollView(
        slivers: [
          OrderHistoryAppBar(),
          SliverToBoxAdapter(
            child: ListTile(
              leading: Text(
                'Novemver 09, 2021',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: AppColors.darkGreyColor),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingExtraLarge,
                      vertical: AppDimension.paddingSmall),
                  child: Container(
                    padding: const EdgeInsets.all(AppDimension.paddingSmall),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.blackColor6,
                            blurRadius: 19,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                            AppDimension.borderRadiusSmall)),
                    child: ListTile(
                      title: Text('OD - 58858 - N'),
                      subtitle: Text('1121.00 TMT'),
                      trailing: ElevatedButton(
                        child: Text('SHIPPED'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: Text(
                'Novemver 08, 2021',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: AppColors.darkGreyColor),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Container(
                padding: const EdgeInsets.all(AppDimension.paddingSmall),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.blackColor6,
                        blurRadius: 19,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius:
                        BorderRadius.circular(AppDimension.borderRadiusSmall)),
                child: ListTile(
                  title: Text('OD - 58858 - N'),
                  subtitle: Text('1121.00 TMT'),
                  trailing: ElevatedButton(
                    child: Text('SHIPPED'),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
