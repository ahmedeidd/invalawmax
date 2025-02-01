import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:inva_lawmax/features/authentication/presentation/pages/authentication_page.dart';
import '../../../../core/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthenticationPage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: Responsive.width(context, 5),
          height: Responsive.height(context, 20),
        )
            .animate()
            .fadeIn(duration: 1.seconds)
            .scale(delay: 1.seconds, duration: 1.seconds),
      ),
    );
  }
}
