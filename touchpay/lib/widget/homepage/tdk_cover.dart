import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/util/screen_util.dart';

class TdkCover extends StatelessWidget {
  const TdkCover({
    Key key,
    @required bool isKeyboardVisible,
    @required this.context,
    this.scale,
  })  : _isKeyboardVisible = isKeyboardVisible,
        super(key: key);

  final bool _isKeyboardVisible;
  final BuildContext context;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isKeyboardVisible ? 0.0 : 1,
      duration: Duration(milliseconds: 280),
      child: Container(
        height: !_isKeyboardVisible ? ScreenUtil.getHeight(context) * scale : 0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/touchpay4.png',
            height: 200,
          ) 
          /*SvgPicture.asset(
            AppConstant.svgLogo,
            height: 200,
          ),*/
        ),
      ),
    );
  }
}
