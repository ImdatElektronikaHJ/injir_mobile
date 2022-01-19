import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/bottom_buttons.dart';
import 'package:tajir/screen/checkout_screen/local_widgets/page_title.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'local_widgets/checkout_summary_container.dart';
import 'local_widgets/checkout_summary_decoration_container.dart';
import 'local_widgets/order_list_product.dart';

class CheckoutSummaryScreen extends StatelessWidget {
  const CheckoutSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PageTitle(title: 'summary'.tr),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimension.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('order_list'.tr),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: AppDimension.marginSmall),
                    child: Column(
                      children: const [
                        OrderListProduct(),
                        OrderListProduct(),
                        OrderListProduct(),
                        OrderListProduct(),
                        OrderListProduct(),
                        OrderListProduct(),
                        OrderListProduct(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total'.tr.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColors.darkGreyColor,
                            ),
                      ),
                      Text(
                        '1055.00 TMT',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  CheckoutSummaryDecorationContainer(
                    child: CheckoutSummaryContainer(
                      title: 'shipping_address'.tr,
                      bodyText1: 'Ashgabat, S Turkmenbashy sayoly 25/22',
                      bodyText2: '+993(64) 059026',
                    ),
                  ),
                  CheckoutSummaryDecorationContainer(
                    child: Text(
                      'Доставка курьером',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  CheckoutSummaryDecorationContainer(
                    child: CheckoutSummaryContainer(
                      title: 'payment'.tr,
                      bodyText1: 'Muhammed Artykov',
                      bodyText2: '4238 9183 8923 9823',
                    ),
                  ),
                  const SizedBox(
                    height: AppDimension.marginExtraLarge,
                  ),
                  BottomButtons(
                    onBackPressed: () {
                      Get.back(id: NestedNavigationIds.cart);
                    },
                    onNextPressed: () {
                      Get.until((route) => route.isFirst,
                          id: NestedNavigationIds.cart);
                    },
                    title: 'pay'.tr,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
