// Libraries
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Don't Touch
class StepBar extends StatelessWidget {
  final int stepNumber;

  // Constructor
  const StepBar({
    Key key,
    this.stepNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return CircularStepProgressIndicator(
      totalSteps: 5000,
      currentStep: stepNumber,
      stepSize: 10,
      selectedColor: AppConstant.kPrimaryColor,
      unselectedColor: Colors.grey[200],
      padding: math.pi / 5000,
      width: 280,
      height: 280,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.orange[100],
              ),
              child: Icon(
                MdiIcons.shoePrint,
                color: AppConstant.kPrimaryColor,
              ),
            ),
            SizedBox(height: defaultSize * 4), // 40
            Text(
              (stepNumber).toString(),
              style: TextStyle(
                fontFamily: 'NexaLight',
                fontSize: defaultSize * 4, // 28
                color: AppConstant.kTextColor,
              ),
            ),
            SizedBox(height: defaultSize * 4), // 40
            Text(
              "GOAL 10.000",
              style: TextStyle(fontFamily: 'Muli', height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
