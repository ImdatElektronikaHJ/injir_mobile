import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class SortPrice extends StatefulWidget {
  const SortPrice({Key? key}) : super(key: key);

  @override
  State<SortPrice> createState() => _SortPriceState();
}

class _SortPriceState extends State<SortPrice> {
  RangeValues _currentRangeValue = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingSmall),
      child: Column(
        children: [
          RangeSlider(
            values: _currentRangeValue,
            min: 0,
            max: 1000,
            labels: RangeLabels(
              _currentRangeValue.start.round().toString(),
              _currentRangeValue.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValue = values;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\t${_currentRangeValue.start.toInt()} \TMT",
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "\t${_currentRangeValue.end.toInt()} \TMT",
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}