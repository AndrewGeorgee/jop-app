import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleLogo extends StatelessWidget {
  final String logo;
  const CircleLogo({
    super.key, required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: SvgPicture.asset(logo),
    );
  }
}
