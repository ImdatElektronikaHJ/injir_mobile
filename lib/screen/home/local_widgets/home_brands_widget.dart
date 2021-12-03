import 'package:flutter/cupertino.dart';
import 'package:tajir/theme/app_dimensions.dart';

class HomeBrandsWidget extends StatelessWidget {
  const HomeBrandsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.homeBrandsHeight + AppDimensions.marginSmall,
      padding: const EdgeInsets.all(AppDimensions.marginSmall),
      child: Image.asset('assets/images/placeholder/bn1.png'),
    );
  }
}
