import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          iconTheme: const IconThemeData(color: AppColors.blackColor),
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: false,
          title:
              Text('Фильтр'.tr, style: Theme.of(context).textTheme.headline6!),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppDimension.paddingLarge),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(AppDimension.paddingSmall),
                width: 500,
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.greyColor))),
                child: Text(
                  'Brands',
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
                    horizontal: AppDimension.paddingLarge,
                    vertical: AppDimension.paddingSmall),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    Text(
                      'Apple (12)',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(AppDimension.paddingSmall),
                width: 500,
                decoration: const BoxDecoration(color: AppColors.greyColor),
                child: Text(
                  'Операционная система',
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
                    horizontal: AppDimension.paddingLarge,
                    vertical: AppDimension.paddingSmall),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    Text(
                      'Apple (12)',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(AppDimension.paddingSmall),
                width: 500,
                decoration: const BoxDecoration(color: AppColors.greyColor),
                child: Text(
                  'Размер эркрана',
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
                    horizontal: AppDimension.paddingLarge,
                    vertical: AppDimension.paddingSmall),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    Text(
                      'Apple (12)',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(AppDimension.paddingSmall),
                width: 500,
                decoration: const BoxDecoration(color: AppColors.greyColor),
                child: Text(
                  'Оперативная память',
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
                    horizontal: AppDimension.paddingLarge,
                    vertical: AppDimension.paddingSmall),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                    Text(
                      'Apple (12)',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
              );
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }
}
