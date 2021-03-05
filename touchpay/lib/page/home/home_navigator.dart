import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchpay/page/rank/rank_page.dart';
import 'package:touchpay/page/home/home_page.dart';
import 'package:touchpay/page/profile/profile_page.dart';
import 'package:touchpay/util/app_constant.dart';


class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentPage = 1;

  List<Widget> _pages = [RankPage(), HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, 
      bottomNavigationBar: ConvexAppBar(
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.kPrimaryColor,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.list, title: ''), // Home
          TabItem(icon: Icons.search, title: ''), // Profile
          TabItem(icon: Icons.person, title: ''), // History
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
