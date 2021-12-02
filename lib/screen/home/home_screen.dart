import 'package:flutter/material.dart';
import 'package:tajir/screen/home/local_widgets/banner_container.dart';
import 'package:tajir/screen/home/local_widgets/featured_block.dart';
import 'package:tajir/screen/home/local_widgets/list_home_brands_widget.dart';
import 'package:tajir/screen/home/local_widgets/list_home_categories_widget.dart';
import 'package:tajir/widget/list_list_product_widget.dart';
import 'package:tajir/theme/app_dimensions.dart';
import 'package:tajir/widget/slide_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.marginMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BannerContainer(
                  child: Container(
                    alignment: Alignment.center,
                    child: SlideBannerWidget(
                      slideBanners: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/placeholder/slider1.png'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/placeholder/bn1.png'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/placeholder/bn2.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BannerContainer(
                    child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/placeholder/bn1.png'),
                    ),
                  ),
                )),
                BannerContainer(
                    child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/placeholder/bn2.png'),
                    ),
                  ),
                )),
                const FeaturedBlockWidget(
                  title: 'Top Categories',
                  childWidget: ListHomeCategoriesWidget(),
                  onSeeAllTapped: onTopCategoriesTapped,
                ),
                const FeaturedBlockWidget(
                  title: 'Trending items',
                  childWidget: ListListProductWidget(),
                ),
                const FeaturedBlockWidget(
                  title: 'New items',
                  childWidget: ListListProductWidget(),
                ),
                const FeaturedBlockWidget(
                  title: 'Brands',
                  childWidget: ListHomeBrandsWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// just a placeholder for testing
void onTopCategoriesTapped() {
  //TODO: add click listener
  print('fsdkfljds;lkj');
}
