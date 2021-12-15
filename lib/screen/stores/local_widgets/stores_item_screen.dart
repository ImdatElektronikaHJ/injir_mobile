import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class StoresItemScreen extends StatelessWidget {
  const StoresItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.paddingMedium,
          horizontal: AppDimension.paddingSmall,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                spreadRadius: 0,
                blurRadius: 16,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: AppDimension.paddingSmall),
            child: Column(children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/placeholder/Samsung_Logo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Samsung',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
