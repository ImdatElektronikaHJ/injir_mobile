import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/data/shared_preferences/storage_initial.dart';
import 'package:tajir/theme/app_animation.dart';
import 'package:tajir/theme/app_colors.dart';
import 'local_widgets/blue_painter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeInAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration:
          const Duration(milliseconds: AppAnimation.splashAnimationDuration),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    _controller.addListener(_controllerListener);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.darkBlueColor),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomPaint(
          willChange: true,
          painter: BluePainter(animation: _controller),
          child: Center(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return FadeTransition(
                    opacity: _fadeInAnimation,
                    child: Image.asset(
                      'assets/images/tajir_logo_text.png',
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  _controllerListener() {
    if (_controller.value == 1.0) {
      _openNextScreen();
    }
  }

  _openNextScreen() async {
    if (await StorageInitial.isFirstOpen()) {
      await StorageInitial.updateFirstOpen();
      await Get.offAndToNamed(AppRoutes.showcaseRoute);
    } else {
      await Get.offAndToNamed(AppRoutes.dashboardRoute);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
