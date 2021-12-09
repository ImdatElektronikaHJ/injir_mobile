import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ProductExpansionDescription extends StatefulWidget {
  final String title;
  final Widget child;

  const ProductExpansionDescription(
      {Key? key, required this.title, required this.child})
      : super(key: key);
  @override
  _ProductExpansionDescriptionState createState() =>
      _ProductExpansionDescriptionState();
}

class _ProductExpansionDescriptionState
    extends State<ProductExpansionDescription> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      key: const Key('expansionList'),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      expandedHeaderPadding: EdgeInsets.zero,
      elevation: 0.0,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: _isExpanded,
          headerBuilder: (context, isExpaned) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                ),
              ),
            );
          },
          body: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingMedium),
              child: widget.child),
        )
      ],
    );
  }
}
