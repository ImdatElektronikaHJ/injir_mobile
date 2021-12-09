import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class CategoriesScreenItem extends StatelessWidget {
  final Function? onCategoryTapped;

  const CategoriesScreenItem({Key? key,this.onCategoryTapped})   : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppDimension.paddingMedium, horizontal: AppDimension.paddingSmall,),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: AppDimension.paddingSmall),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration:const  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/placeholder/1t.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Элетроника',
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                  ),
                ]),
              ),
            ),
          ),
          onTap: () => onCategoryTapped!(),
        );
  }
}