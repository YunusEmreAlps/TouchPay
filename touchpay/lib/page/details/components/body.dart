// Libraries
import 'info.dart';
import 'dart:convert';
import 'package:touchpay/sharedpreferences/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:touchpay/model/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/widget/social_card.dart';
import 'package:touchpay/widget/default_button.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:touchpay/widget/custom_alert.dart';
import 'package:touchpay/util/app_constant.dart';

// Structure
class Body extends StatefulWidget {
  const Body({Key key, this.model}) : super(key: key);
  final Post model;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ExpansionTileCardState> cardAboutUs = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardGoals = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            avatar: widget.model.avatar,
            title: widget.model.title,
            post_description: widget.model.post_description,
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), // 20

          // Social Card
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: "assets/icons/globe.svg",
                color: Color(0xFFF5F6F9),
                press: () => launch(widget.model.website),
              ),
              SocialCard(
                icon: "assets/icons/facebook-2.svg",
                color: Color(0xFFF5F6F9),
                press: () => launch(widget.model.facebook),
              ),
              SocialCard(
                icon: "assets/icons/twitter.svg",
                color: Color(0xFFF5F6F9),
                press: () => launch(widget.model.twitter),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), // 20

          // About Us
          Theme(
            data: ThemeData(
              backgroundColor: Colors.white,
            ),
            child: ExpansionTile(
              key: cardAboutUs,
              leading: SvgPicture.asset("assets/icons/question.svg"),
              title: Text(
                "About Us",
                style: TextStyle(
                  fontFamily: 'NexaLight',
                  fontSize: SizeConfig.defaultSize * 1.8, // 18
                  color: AppConstant.kTextColor,
                ),
              ),
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      widget.model.aboutus,
                      style: TextStyle(
                        fontFamily: 'CaviarDreams',
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Goals
          Theme(
            data: ThemeData(
              backgroundColor: Colors.white,
            ),
            child: ExpansionTile(
              key: cardGoals,
              leading: SvgPicture.asset("assets/icons/origin.svg"),
              title: Text(
                "Goals",
                style: TextStyle(
                  fontFamily: 'NexaLight',
                  fontSize: SizeConfig.defaultSize * 1.8, // 18
                  color: Color(0xFF202E2E),
                ),
              ),
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      widget.model.goals,
                      style: TextStyle(
                        fontFamily: 'CaviarDreams',
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: <Widget>[
                DefaultButton(
                  text: AppConstant.kDonateText +
                      widget.model.payment.toString() +
                      ' STEP',
                  buttonColor: AppConstant.kPrimaryColor,
                  textColor: Colors.white,
                  press: () {
                    _showDialog();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                AppConstant.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                'Are you sure?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 130.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () =>
                          {pay(widget.model.payment), Navigator.pop(context)},
                      color: AppConstant.kPrimaryColor,
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 130.0,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: AppConstant.kPrimaryColor),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: AppConstant.kPrimaryColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  void _showResultDialog(String resultText) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15.0),
              Text(
                AppConstant.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                resultText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 130.0,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: AppConstant.kPrimaryColor),
                      child: Text(
                        'Okey',
                        style: TextStyle(
                          color: AppConstant.kPrimaryColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  void pay(int odenecek) async {
    var ToplamOdenen = await Pref().loadInt("odenen");
    var ToplamAdim = await Pref().loadInt("adim");

    int gecerliAdim = ToplamAdim - ToplamOdenen;

    if (gecerliAdim >= odenecek) {
      ToplamOdenen += odenecek;

      Pref().saveInt("odenen", ToplamOdenen);
      _showResultDialog("Congratulations!\nYour payment is successful.");
    } else {
      _showResultDialog("Whoops,\nSomething went wrong.");
      //Pref().save("odenen", 0);
    }
  }
}
