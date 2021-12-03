import 'package:flutter/cupertino.dart';
import 'package:tajir/theme/app_dimension.dart';

class HomeBrandsWidget extends StatelessWidget {
  const HomeBrandsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.homeBrandsHeight + AppDimension.marginSmall,
      padding: const EdgeInsets.all(AppDimension.marginSmall),
      child: Image.asset('assets/images/placeholder/bn1.png'),
    );
  }
}
