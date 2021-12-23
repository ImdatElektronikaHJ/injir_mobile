import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class RegistrationDropdownButton extends StatefulWidget {
  const RegistrationDropdownButton({Key? key}) : super(key: key);

  @override
  _RegistrationDropdownButtonState createState() =>
      _RegistrationDropdownButtonState();
}

class _RegistrationDropdownButtonState
    extends State<RegistrationDropdownButton> {
  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusMicro)),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingSmall,
          vertical: AppDimension.paddingSmall / 2),
      child: DropdownButton(
        value: dropdownValue,
        onChanged: (int? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        icon: const Icon(
          CupertinoIcons.chevron_down,
        ),
        elevation: 1,
        isDense: false,
        isExpanded: true,
        selectedItemBuilder: (BuildContext context) {
          return List<int>.generate(15, (index) => index).map((int? value) {
            return Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$value",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
            );
          }).toList();
        },
        underline: const SizedBox(),
        items: List<int>.generate(15, (index) => index)
            .map((value) => DropdownMenuItem(
                  child: Text('$value'),
                  value: value,
                ))
            .toList(),
      ),
    );
  }
}
