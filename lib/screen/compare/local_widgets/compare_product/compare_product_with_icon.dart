import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompareProductWithIcon extends StatelessWidget {
  final Widget child;
  final Function()? onDeleteTapped;

  const CompareProductWithIcon(
      {Key? key, this.onDeleteTapped, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        IconButton(
          onPressed: onDeleteTapped,
          icon: const Icon(CupertinoIcons.delete),
        ),
      ],
    );
  }
}
