import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class PaymentMethodContainerExpanded extends StatelessWidget {
  final bool isMainTitleChecked;
  final String title;
  final void Function() onMainTitleTapped;
  final void Function(int) onSubTitleTapped;
  final int currentSubTitleIndex;

  const PaymentMethodContainerExpanded({
    Key? key,
    required this.title,
    required this.onMainTitleTapped,
    required this.onSubTitleTapped,
    required this.isMainTitleChecked,
    required this.currentSubTitleIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal:
                AppDimension.marginLarge + AppDimension.marginExtraLarge,
            vertical: AppDimension.marginMedium / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimension.paddingMedium,
            vertical: AppDimension.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusMicro),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackColor10,
              blurRadius: 10.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            PaymentItem(
              isPaymentChecked: isMainTitleChecked,
              onPaymentTapped: () {
                onMainTitleTapped();
              },
              title: 'Онлайн',
            ),
            const Divider(
              color: AppColors.lightBlueGreyColor,
            ),

            ///SubTitleCheckers
            PaymentItem(
              isPaymentChecked: currentSubTitleIndex == 0,
              onPaymentTapped: () {
                onSubTitleTapped(0);
              },
              title: 'Внешка',
            ),
            PaymentItem(
              isPaymentChecked: currentSubTitleIndex == 1,
              onPaymentTapped: () {
                onSubTitleTapped(1);
              },
              title: 'Milli cart',
            ),
            PaymentItem(
              isPaymentChecked: currentSubTitleIndex == 2,
              onPaymentTapped: () {
                onSubTitleTapped(2);
              },
              title: 'Visa',
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final bool isPaymentChecked;
  final void Function() onPaymentTapped;
  final String title;
  const PaymentItem(
      {Key? key,
      this.isPaymentChecked = false,
      required this.onPaymentTapped,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPaymentTapped();
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall),
        color: AppColors.whiteColor,
        child: Row(
          children: [
            Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isPaymentChecked
                            ? AppColors.blueColor
                            : AppColors.darkGreyColor,
                      )),
            ),
            Icon(
              isPaymentChecked
                  ? CupertinoIcons.largecircle_fill_circle
                  : CupertinoIcons.circle,
              key: UniqueKey(),
              color:
                  isPaymentChecked ? AppColors.blueColor : AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
