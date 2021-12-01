import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';
import 'package:tajir/widget/animated_like_button.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.listProductHeight + AppDimensions.marginLarge,
      width: AppDimensions.listProductWidth + AppDimensions.marginMedium,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.marginMedium / 2,
          vertical: AppDimensions.marginMedium),
      padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor6,
            blurRadius: 19,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 3, child: imageBlock(context)),
          ratingBlock(context),
          titleBlock(context),
          priceBlock(context),
        ],
      ),
    );
  }

  Stack imageBlock(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingSmall),
          child: Center(
            child: Image.asset('assets/images/samsung.png'),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: AnimatedLikeButton(
            isInWishList: true,
            onFavoriteTapped: (bool isInWishlist) {
              print(isInWishlist);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSmall),
            decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall / 2),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSmall / 1.5,
                vertical: AppDimensions.paddingSmall / 3),
            child: Text(
              '-20%',
              maxLines: 1,
              style: Theme.of(context).textTheme.button!.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Center ratingBlock(BuildContext context) {
    var rating = 3.5;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingSmall / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < rating.floor()
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    color: AppColors.amberColor,
                    size: 14.0,
                  )
              ],
            ),
            const SizedBox(
              width: AppDimensions.marginSmall / 2,
            ),
            Text(
              '(33)',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Padding titleBlock(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall,
          vertical: AppDimensions.paddingSmall / 2),
      child: Text(
        'Смартфон Samsung Galaxy Note 10+ 12/256GB White(SM-N975FZWDSER)',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.0),
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Padding priceBlock(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '13732 TMT',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: AppColors.darkBlueColor, fontWeight: FontWeight.bold),
          ),
          Visibility(
            child: Text('13732 TMT',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(decoration: TextDecoration.lineThrough)),
          )
        ],
      ),
    );
  }
}
