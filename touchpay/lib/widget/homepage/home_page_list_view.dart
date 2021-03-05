import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchpay/model/Post.dart';
import 'package:touchpay/util/app_constant.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:touchpay/page/details/details_screen.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    Key key,
    this.post,
    this.press,
  }) : super(key: key);

  final Post post;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _cards(context, list[0]),
          _cards(context, list[1]),
          _cards(context, list[2]),
          _cards(context, list[3]),
        ],
      ),
    );
  }

  Widget _cards(context, Post model) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(model: model),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(model.avatar)
                      // image: NetworkImage(person.avatar),
                      ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.white,
                      offset: Offset(4, 4),
                    )
                  ]),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.title[0].toUpperCase() + model.title.substring(1),
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(height: 5),
                Text(
                  (model.post_description.length <= 25)
                      ? (model.post_description)
                      : (model.post_description.substring(0, 25) + '...'),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  "${model.payment.toString()} STEP",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppConstant.kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
