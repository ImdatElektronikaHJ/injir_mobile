import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class AddressScreenActionButton extends StatelessWidget {
  final String title;
  final Function()? onActionTapped;
  
  const AddressScreenActionButton({Key? key,
      required this.title,
      this.onActionTapped})
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingMedium, vertical: AppDimension.paddingSmall),
      child: ElevatedButton(onPressed: onActionTapped, child: Text(title)),
    );
  }
}