import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CardContainer extends StatelessWidget {
  final String? codeText;
  final String? expiryTime;
  final String? cardHolder;
  const CardContainer(
      {Key? key, this.codeText, this.expiryTime, this.cardHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Change design if needed
    return SliverToBoxAdapter(
      child: Container(
        height: 170.0,
        margin: const EdgeInsets.symmetric(
            horizontal:
                AppDimension.marginLarge + AppDimension.marginExtraLarge,
            vertical: AppDimension.marginMedium),
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackColor10,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingMedium),
              child: Text(
                codeText!.isEmpty ? 'XXXX XXXX XXXX XXXX' : codeText!,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
            const SizedBox(
              height: AppDimension.paddingLarge,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: AppDimension.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Holder',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppDimension.paddingSmall / 2),
                              child: Text(
                                cardHolder!.isEmpty
                                    ? 'First & Last Name'.toUpperCase()
                                    : cardHolder!,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: AppDimension.paddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimension.paddingSmall),
                          child: Text(
                            expiryTime!.isEmpty ? 'MM/YY' : expiryTime!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
