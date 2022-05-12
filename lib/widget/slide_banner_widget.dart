import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tajir/model/slide_banner.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/caching_image.dart';

class SlideBannerWidget extends StatefulWidget {
  final List<SlideBanner> slideBanners;
  final Color activeColor;
  final Color disabledColor;
  const SlideBannerWidget(
      {Key? key,
      required this.slideBanners,
      required this.activeColor,
      required this.disabledColor})
      : super(key: key);

  @override
  _SlideBannerWidgetState createState() => _SlideBannerWidgetState();
}

class _SlideBannerWidgetState extends State<SlideBannerWidget> {
  late List<SlideBanner> _slideBanners;
  int _currentIndex = 0;

  @override
  void initState() {
    _slideBanners = widget.slideBanners;
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
              .map((e) => ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDimension.borderRadiusMedium),
                  child: CachingImage(
                    e.image ?? '',
                    fit: BoxFit.cover,
                  )))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            aspectRatio: 16 / 8,
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
                width: 10.0,
                margin: const EdgeInsets.symmetric(
                  vertical: AppDimension.marginMedium,
                  horizontal: AppDimension.marginSmall,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? widget.activeColor
                      : widget.disabledColor,
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
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
