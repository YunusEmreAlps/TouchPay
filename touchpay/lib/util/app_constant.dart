import 'package:flutter/material.dart';
import 'package:touchpay/util/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  // Colors
  static final Color colorPrimary = Color(0xFFE11E3C);
  static final Color colorPageBg = Color(0xFFF8F8F8);
  static final Color colorHeading = Color(0xFF0A151F);
  static final Color colorParagraph = Color(0xFF4B5866);
  static final Color colorParagraph2 = Color(0xFF758291);
  static final Color colorVowelBg = Color(0xFFF0F0F0);
  static final Color colorUnifiedWordBg = Color(0xFFE8F0F1);
  static final Color colorUnifiedWordSearch = Color(0xFF73A5AA);
  static final Color colorUnifiedWordText = Color(0xFF2E494C);
  static final Color colorProverbsIdiomsBg = Color(0xFFF9F5F1);
  static final Color colorProverbsIdiomsSearch = Color(0xFFBB8E62);
  static final Color colorProverbsIdiomsText = Color(0xFF4F3822);
  static final Color colorVersionText = Color(0xFFF3A5B1);
  static final Color colorDrawerButton = Color(0xFFE8EAED);
  static final Color colorPullDown1 = Color(0xFFB41830);
  static final Color colorPullDown2 = Color(0xFFDEE3E3);
  static final Color colorBackButton = Color(0xFF48515B);
  static final Color colorAppDescription = Color(0xFF33414C);
  static final Color colorBottomSheetItemHeader = Color(0xFF183148);
  static final Color colorBottomSheetDivider = Color(0xFFEEF0F2);

  static final Color green = Color(0xff16d19a);
  static final Color grey = Color(0xffd2d1e1);
  static final Color colorRating = Color(0xfffec107);
  static final Color kTextColor = Color(0xFF757575); // Text
  static final Color kPrimaryColor = Color(0xFFFF7643); // Button
  static final Color kSecondaryColor = Color(0xFF979797); // Icon
  static final Color kPrimaryLightColor = Color(0xFFE4E9F2); // Background
  static final Color kSecondaryLightColor = Color(0xFFEFEFF4); // Background
  static final Color kSecondaryDarkColor = Color(0xFF404040);
  static final Color kAccentLightColor = Color(0xFFB3BFD7);
  static final Color kAccentDarkColor = Color(0xFF4E4E4E);
  static final Color kBackgroundDarkColor = Color(0xFF3A3A3A);
  static final Color kSurfaceDarkColor = Color(0xFF222225);

  static final Color kAccentIconLightColor = Color(0xFFECEFF5);
  static final Color kAccentIconDarkColor = Color(0xFF303030);
  static final Color kPrimaryIconLightColor = Color(0xFFECEFF5);
  static final Color kPrimaryIconDarkColor = Color(0xFF232323);

  static final Color kBodyTextColorLight = Color(0xFFA1B0CA);
  static final Color kBodyTextColorDark = Color(0xFF7C7C7C);
  static final Color kTitleTextLightColor = Color(0xFF101112);
  static final Color kTitleTextDarkColor = Colors.white;

  static final Color kShadowColor = Color(0xFF364564);

  static final kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  // End

  static final double kDefaultPadding = 20.0;

  // Fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;
  // End

  // Strings
  static final String appName = 'TouchPay';
  static final String appVersion = "v.1.0";
  static final String appDescription = 'Touch Other Lives With Your Steps';
  static final String hakkinda = "About Us";
  static final String contact = "Contact Us";
  static final String contactDetails = 'Contact Details';
  static final String epostayaz = 'Write E-Mail';
  static final String katkioneri = 'Suggestions';
  static final String katkiOneriDetails =
      'If you have any queries or issues for which you need your assistance: Feel free to mail us.';
  static final String address = '';
  static final String phoneNumber = '+90 553 698 89 10';
  static final String eposta = 'info@touchpay.com.tr';
  static final String magaza = '';
  static final String eMagaza = 'E-Donation';
  static final String magazaAddress = '';
  static final String appLongRichDescription = "TouchPay";
  static final String appLongDescription = ' founded in 2021.';

  // Welcome Screen Slider
  static final String welcomeSlide1Text = 'Welcome to TouchPay!';
  static final String welcomeSlide2Text = 'We help people to connect with \naround from nearby or around the world.';
  static final String welcomeSlide3Text = 'Take an Action For Other Peoples';

  // Button
  static final String kContinueText = 'Continue';
  static final String kDonateText = 'Donate Now : ';

  // Divider Text
  static final String kOrText = 'OR';


  // Ends

  // Page
  static final String pageSplash = "/";
  static final String pageHome = "/home";
  static final String pageWelcome = "welcome";
  // End

  // Assets
  static final String svgLogo = "assets/images/svgLogo4.svg";
  static final String svgMessage = "assets/images/tdk_icon_message.svg";
  // End
}

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);

buildTextTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity
            ? Colors.grey[400]
            : AppConstant.kPrimaryColor, // Colors.black
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
      ),
    ),
  );
}

// Circular Input Design
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: Color(0xFFF5F6F9)), // Social Card
  );
}

// OTP
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
