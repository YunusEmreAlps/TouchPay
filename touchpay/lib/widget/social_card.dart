// Libraries
import 'package:flutter/material.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.color,
    this.press,
  }) : super(key: key);

  final String icon;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize), // 10
        padding: EdgeInsets.all(SizeConfig.defaultSize * 0.6), // 6
        height: SizeConfig.defaultSize * 3.5, // 35
        width: SizeConfig.defaultSize * 3.5, // 35
        decoration: BoxDecoration(
          color: color, // Color(0xFFF5F6F9)
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }  
}

