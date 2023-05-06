import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../../shared/components/1Tooles/7custom_fading_widget.dart';
import '../../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/1Splash_Widget/body.dart';
import '../2register_Screen/register_view.dart';

class SplashView extends StatefulWidget {
  Widget startWidget;

  SplashView({
    required this.startWidget,
  });

  @override
  _SplashViewState createState() => _SplashViewState(startWidget: startWidget);
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  Timer? _timer;

  Widget? startWidget;

  _SplashViewState({
    required this.startWidget,
  });
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, startWidget);
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
