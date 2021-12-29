import 'package:flutter/material.dart';
import 'package:tajir/screen/search/local_widgets/search_header_widget.dart';
import 'package:tajir/screen/search/local_widgets/search_list_product.dart';
import 'package:tajir/screen/search/local_widgets/search_tag_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchHeader(
                title: 'Часто задаваемые'.toUpperCase(),
              ),
              Wrap(
                children: const [
                  SearchTagWidget(
                    tagTitle: 'IphoneX',
                  ),
                  SearchTagWidget(
                    tagTitle: 'Xiaomi',
                  ),
                  SearchTagWidget(
                    tagTitle: 'Huawei',
                  ),
                  SearchTagWidget(
                    tagTitle: 'Nokia',
                  ),
                  SearchTagWidget(
                    tagTitle: 'Samsung',
                  ),
                  SearchTagWidget(
                    tagTitle: 'T-shirt',
                  ),
                ],
              ),
              SearchHeader(
                title: 'Рекомендованные'.toUpperCase(),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SearchListProduct(),
              SearchListProduct(),
              SearchListProduct(),
              SearchListProduct(),
            ],
          ),
        ),
      ],
    );
  }

  _goToProductScreen() {
    // Get.find<DashboardController>().updateVisibilityOfSearchBar(false);
    // Get.toNamed(AppRoutes.productRoute, id: NestedNavigationIds.search);
  }
}
