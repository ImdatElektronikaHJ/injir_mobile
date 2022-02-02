import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/svg_icons.dart';
import 'package:tajir/widget/become_seller_button.dart';

class BecomeSellerScreen extends StatelessWidget {
  const BecomeSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            SvgImages.become_seller,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Become a seller',
          style:
              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimension.paddingExtraLarge,
              vertical: AppDimension.paddingLarge),
          child: Text(
            'Original with 1000 product from a lot of  different brand accros the world. buy so easy with just simple step then your item will send it.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 14.0, color: AppColors.greyColor),
          ),
        ),
        BecomeSellerButton(
          onActionTapped: () {
            print('asdasdasd');
          },
        ),
      ],
    );
  }
}
