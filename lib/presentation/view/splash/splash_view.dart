import 'package:flutter/material.dart';
import '../../../app/components/branding_widget.dart';
import '../../../app/constants/constants.dart';
import '../../../app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 1),
            builder: (context, value, widget) => AnimatedOpacity(
              opacity: value,
              duration: const Duration(seconds: AppConsts.splashTime-1),
              child: widget,
            ),
            child: const BrandingWidget(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: AppConsts.splashTime), () {
      Navigator.pushReplacementNamed(context, AppRoutes.mainRoute);
    });
  }
}
