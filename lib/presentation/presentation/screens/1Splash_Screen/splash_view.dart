import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../../shared/components/1Tooles/7custom_fading_widget.dart';
import '../../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/1Splash_Widget/body.dart';
import '../2home_page/Home_Screen.dart';

class SplashView extends StatefulWidget {
  SplashView();

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  Timer? _timer;

  _SplashViewState();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, LoadingListPage());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Splash_Body();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
