import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class SlideBannerWidget extends StatefulWidget {
  final List<dynamic> slideBanners;
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
  late List<dynamic> _slideBanners;
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
              .map(
                (e) => ClipRRect(
                  child: e,
                  borderRadius:
                      BorderRadius.circular(AppDimension.borderRadiusMedium),
                ),
              )
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
