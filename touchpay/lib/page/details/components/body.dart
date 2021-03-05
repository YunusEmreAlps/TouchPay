// Libraries
import 'info.dart';
import 'package:flutter/material.dart';
import 'package:touchpay/model/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/widget/social_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';


// Structure
class Body extends StatefulWidget {
  const Body({Key key, this.model}) : super(key: key);
  final Post model;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ExpansionTileCardState> cardAboutUs = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardSkills = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardHobbies = new GlobalKey();

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
                press: () => launch(widget.model.website),
              ),
              SocialCard(
                icon: "assets/icons/facebook-2.svg",
                press: () => launch(widget.model.facebook),
              ),
              SocialCard(
                icon: "assets/icons/twitter.svg",
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
                     "I solve problems in creative ways. At Konya NEU, where I am completing my junior year in the College of Engineering, I have learned the importance of applying classical strategies to modern-day projects. Software engineering is never ending puzzle that I am passionately in solving. This passion carried me through my education Purdue. First, I learned C then C++. I studied new languages, algorithms, compilers, higher mathematics, all with pretty much the same fascination.\n\nSo, now, in industry, this passion remains with me. There’s certainly yet more to learn, yet more problems, and yet more to build.",
                      style: TextStyle(fontFamily: 'CaviarDreams', height: 1.5,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
