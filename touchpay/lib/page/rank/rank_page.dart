import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchpay/util/app_constant.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  PageController _pageController = PageController(initialPage: 0);
  bool isEmpty = false;

  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
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
          'Ranking',
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
            style: TextStyle(fontWeight: FontWeight.bold, color: AppConstant.colorParagraph2),
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

        _pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
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
                  fontWeight: _selectedCategory == id ? FontWeight.bold : FontWeight.normal,
                )),
            SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 2,
              width: _selectedCategory == id ? title.length * 4.5 : 0,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyItem({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            // Navigator.push(context, CupertinoPageRoute(builder: (context) => WordDetailPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstant.colorPrimary,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
