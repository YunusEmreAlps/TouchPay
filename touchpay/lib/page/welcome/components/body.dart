// Libraries
import 'package:flutter/material.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:touchpay/util/app_constant.dart';

// Components
import 'welcome_content.dart';
import 'package:touchpay/widget/default_button.dart';

// Welcome Body (Slider Page must be to part)
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> welcomeData = [
    {"text": AppConstant.welcomeSlide1Text, "image": "assets/images/slider_1.png"},
    {"text": AppConstant.welcomeSlide2Text, "image": "assets/images/slider_2.png"},
    {"text": AppConstant.welcomeSlide3Text, "image": "assets/images/slider_4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: welcomeData.length,
                itemBuilder: (context, index) => WelcomeContent(
                  image: welcomeData[index]["image"],
                  text: welcomeData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    // Dots
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        welcomeData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),

                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: AppConstant.kContinueText,
                      buttonColor: AppConstant.kPrimaryColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.popAndPushNamed(context, AppConstant.pageHome);
                      } ,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dot Animations
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppConstant.kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
