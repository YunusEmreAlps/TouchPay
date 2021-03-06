import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/page/profile/sections.dart';
import 'package:touchpay/page/profile/header_info.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:touchpay/widget/profilepage/status_bar.dart';
import 'package:touchpay/widget/profilepage/step_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:touchpay/sharedpreferences/sharedpreferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

  int step = 0;
  int toplamOdenen = 0;
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController(initialPage: 0);
  Stream<StepCount> _stepCountStream;
  bool isEmpty = false;

  int _selectedCategory = 0;

  String _steps = '?';

  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    odenen_al();
    var _widthFull = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        backgroundColor: AppConstant.colorPageBg,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: AppConstant.colorHeading),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.clear,
              color: AppConstant.colorHeading,
            ),
            onPressed: () {
              setState(() {
                isEmpty = !isEmpty;
              });
            },
          )
        ],
        brightness: Brightness.light,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderInfo(
                    isMain: true,
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2), // 20
                  // Step Bar
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StepBar(
                          stepNumber: widget.step - widget.toplamOdenen,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        StatCard(
                          title: 'Total Step',
                          achieved: widget.step.toDouble(),
                          total: 10000,
                          identity: 'STEP',
                          color: AppConstant.kPrimaryColor,
                          image: Image.asset('assets/images/walking.png',
                              width: 40),
                        ),
                        StatCard(
                          title: 'Calories',
                          achieved: widget.step * 0.05,
                          total: 2500, // per day
                          identity: 'KCAL',
                          color: AppConstant.kPrimaryColor,
                          image:
                              Image.asset('assets/images/fire.png', width: 40),
                        ),
                        StatCard(
                          title: 'Distance',
                          achieved: (widget.step * 0.0008),
                          total: 1000,
                          identity: 'KM',
                          color: AppConstant.kPrimaryColor,
                          image: Image.asset('assets/images/distance.png',
                              width: 40),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderEmptyState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history,
            size: 48,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'No Activity',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstant.colorParagraph2),
          ),
        ],
      ),
    );
  }

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = id;
        });

        _pageController.animateToPage(id,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: _selectedCategory == id
                      ? FontWeight.bold
                      : FontWeight.normal,
                )),
            SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 2,
              width: _selectedCategory == id ? title.length * 4.5 : 0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }

  void odenen_al() async {
    widget.toplamOdenen = await Pref().loadInt("odenen");
    print(widget.toplamOdenen.toString());
  }

  void onStepCount(StepCount event) {
    setState(() {
      print("yürüme:" + event.toString());
      widget.step = event.steps;
      Pref().saveInt("adim", event.steps);
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
}
