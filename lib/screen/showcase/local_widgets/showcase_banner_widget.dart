import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tajir/theme/app_images.dart';
import 'package:tajir/screen/showcase/local_widgets/showcase_banner_item_widget.dart';
import 'package:tajir/theme/app_animation.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShowcaseBannerWidget extends StatefulWidget {
  const ShowcaseBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseBannerWidgetState createState() => _ShowcaseBannerWidgetState();
}

class _ShowcaseBannerWidgetState extends State<ShowcaseBannerWidget> {
  late List<Widget> _showcaseBanners;
  int _currentIndex = 0;
  final double _dotSize = 10.0;

  @override
  void initState() {
    _showcaseBanners = _createBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: _showcaseBanners,
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: MediaQuery.of(context).size.height * 4 / 7,
            autoPlay: true,
            autoPlayInterval: const Duration(
                milliseconds: AppAnimation.bannerChangeAnimationDuration),
            onPageChanged: (index, reason) => _pageChanged(index),
          ),
        ),
        const SizedBox(
          height: AppDimension.paddingExtraLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _showcaseBanners.map((slideBanner) {
            int index = _showcaseBanners.indexOf(slideBanner);
            return AnimatedContainer(
              duration:
                  const Duration(milliseconds: AppAnimation.durationShort),
              height: _dotSize,
              width: _dotSize,
              margin: const EdgeInsets.symmetric(
                vertical: AppDimension.marginMedium,
                horizontal: AppDimension.marginSmall,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? AppColors.darkerGreyColor
                    : AppColors.lightGreyColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  _pageChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  List<Widget> _createBanners() {
    return [
      const ShowcaseBannerItemWidget(
        imageAsset: AppImage.showcaseBannerOne,
        title: 'Place holder title',
        description: 'Some description witch is should be learge as possible',
      ),
      const ShowcaseBannerItemWidget(
        imageAsset: AppImage.showcaseBannerTwo,
        title: 'Place holder title',
        description: 'Some description witch is should be learge as possible',
      ),
      const ShowcaseBannerItemWidget(
        imageAsset: AppImage.showcaseBannerThree,
        title: 'Place holder title',
        description: 'Some description witch is should be learge as possible',
      ),
    ];
  }
}
