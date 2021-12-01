import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class SlideBannerWidget extends StatefulWidget {
  final List<dynamic> slideBanners;
  final Function(String url) onBannerTapped;
  const SlideBannerWidget(
      {Key? key, required this.slideBanners, required this.onBannerTapped})
      : super(key: key);

  @override
  _SlideBannerWidgetState createState() => _SlideBannerWidgetState();
}

class _SlideBannerWidgetState extends State<SlideBannerWidget> {
  late List<dynamic> _slideBanners;
  late Function(String) _onBannerTapped;
  int _currentIndex = 0;

  @override
  void initState() {
    _slideBanners = widget.slideBanners;
    _onBannerTapped = widget.onBannerTapped;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        CarouselSlider(
          items: _slideBanners
              .map((e) => GestureDetector(
                  onTap: () => _onBannerTapped(e.link),
                  child: ClipRRect(
                    child: e,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadiusMedium),
                  )))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              _pageChanged(index);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _slideBanners.map((slideBanner) {
              int index = _slideBanners.indexOf(slideBanner);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 10.0,
                width: _currentIndex == index ? 10.0 : 10.0,
                margin: const EdgeInsets.symmetric(
                    vertical: AppDimensions.marginMedium,
                    horizontal: AppDimensions.marginSmall / 1.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? AppColors.blackColor25
                      : AppColors.blackColor10,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _pageChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void didUpdateWidget(covariant SlideBannerWidget oldWidget) {
    if (oldWidget.slideBanners != widget.slideBanners) {
      setState(() {
        _currentIndex = 0;
        _slideBanners = widget.slideBanners;
        _onBannerTapped = widget.onBannerTapped;
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
