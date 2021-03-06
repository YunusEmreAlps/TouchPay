import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:touchpay/model/Post.dart';
import 'package:touchpay/sharedpreferences/sharedpreferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/page/details/components/body.dart';

// Structure
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.model}) : super(key: key);
  final Post model;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void stepInfo() {
    Pedometer.stepCountStream.listen(onStepCount);
  }

  void onStepCount(StepCount event) {
    print("yürüme:" + event.toString());
    int step = event.steps;
    if (!mounted) return;
    Pref().saveInt("adim", event.steps);
  }

  @override
  Widget build(BuildContext context) {
    stepInfo();
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        model: widget.model,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.model.mail, widget.model.title, '');
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  // Sending Mail Function
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppConstant.kPrimaryGradientColor,
        ),
      ),
      leading: SizedBox(),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.model.title,
        style: TextStyle(
            fontFamily: 'NexaLight',
            letterSpacing: 2,
            color: AppConstant.kPrimaryLightColor),
      ),
    );
  }
}
