import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/sort/local_widgets/sort_app_bar.dart';
import 'package:tajir/screen/sort/local_widgets/sort_price_tile.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/rating_widget.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key? key}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: CustomScrollView(
        slivers: [
          SortAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingExtraLarge,
                      vertical: AppDimension.paddingSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apple',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: 25,
                        child: Radio(
                          value: false,
                          groupValue: _value,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimension.paddingLarge),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppDimension.paddingSmall),
                      width: 500,
                      decoration:
                          const BoxDecoration(color: AppColors.lightGreyColor),
                      child: Text(
                        'Price',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColors.blackColor),
                      ),
                    ),
                  ]),
            ),
          ),
          const SliverToBoxAdapter(
            child: SortPrice(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimension.paddingLarge),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppDimension.paddingSmall),
                      width: 500,
                      decoration:
                          const BoxDecoration(color: AppColors.lightGreyColor),
                      child: Text(
                        'Payment Options',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColors.blackColor),
                      ),
                    ),
                  ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingExtraLarge,
                      vertical: AppDimension.paddingSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apple',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: 25,
                        child: Radio(
                          value: false,
                          groupValue: _value,
                          onChanged: (value) {
                            for (int i = 5; i > 0; i--) {
                              print('i' * i);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimension.paddingLarge),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppDimension.paddingSmall),
                      width: 500,
                      decoration:
                          const BoxDecoration(color: AppColors.lightGreyColor),
                      child: Text(
                        'Rating',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColors.blackColor),
                      ),
                    ),
                  ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingExtraLarge,
                  vertical: AppDimension.paddingSmall),
              child: Row(
                children: [
                  for (int i = 0; i < 1; i++)
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: Radio(
                      value: false,
                      groupValue: _value,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimension.paddingSmall),
              child: ElevatedButton(child: Text('Apply'), onPressed: () {},),
            ),
          )
        ],
      ),
    );
  }
}
