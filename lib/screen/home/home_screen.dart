import 'package:flutter/material.dart';
import 'package:tajir/model/slide_banner.dart';
import 'package:tajir/screen/home/local_widgets/banner_container.dart';
import 'package:tajir/screen/home/local_widgets/list_home_brands_widget.dart';
import 'package:tajir/screen/home/local_widgets/list_home_categories_widget.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/caching_image.dart';
import 'package:tajir/widget/featured_block/featured_block.dart';
import 'package:tajir/widget/list_list_product_widget.dart';
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
              height: AppDimension.marginMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                BannerContainer(
                  child: SlideBannerWidget(
                    activeColor: AppColors.blackColor25,
                    disabledColor: AppColors.blackColor6,
                    slideBanners: [
                      //TODO: add logic for banners on home screen
                      SlideBanner(
                        image:
                            'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
                      ),
                      SlideBanner(
                        image:
                            'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
                      ),
                      SlideBanner(
                        image:
                            'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
                      ),
                    ],
                  ),
                ),
                // TODO: add banners logic here
                const BannerContainer(
                  child: CachingImage(
                    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
                    fit: BoxFit.cover,
                  ),
                ),
                const BannerContainer(
                  child: CachingImage(
                    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
                    fit: BoxFit.cover,
                  ),
                ),
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
}
