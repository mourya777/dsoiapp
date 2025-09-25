import 'package:flutter/material.dart';
import '../UtilsPage/ColorsPage.dart';

class AdvancedTitleText extends StatelessWidget {
  final String title;

  const AdvancedTitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [
            AppColors.black, AppColors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.white, // ShaderMask के कारण actual color white होगा
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.4),
            ),
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
