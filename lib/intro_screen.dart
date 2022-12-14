import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hammies_user/routes/routes.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'screen/home_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntroductionScreen(
        pages: [
          PageViewModel(
            title: "ð¹ Hammies Mandalian ð¹ áá¾",
            body: '''áá½á±á¸áá½á±á¸áá½á¬ áá¼á­á¯áá­á¯áá­á¯ááºáá«áááº ð²ð² ''',
            image: buildImage('assets/icons/1.png'),
            decoration: getPageDecoration(),
          ),
//             PageViewModel(
//               title: "Hammies Mandalian Accessories & Food",
//               body: '''
//           ð¹Hammies Mandalian ð¹
//
// â Hamster Food and Accessories âáá»á­á¯á¸áá¯á¶áá­á¯
//
// áááºáá±áá¬áááºá¸áá¾á¬ áá­áá­áá­ááºáá¼á­á¯ááº
//
// áááºáá°áá­á¯ááºáá«áá¼á® â''',
//               image: buildImage('assets/2.jpeg'),
//               decoration: getPageDecoration(),
//             ),
          //   PageViewModel(
          //     title: 'EVERYTIME YOU WILL NEED MY CINDY',
          //     body: '''
          // ð¿  ááá®á¸áá½ááºáá¼áá²á·á¡áá«...
          // ð¿  Shopping áá½áá­áá¼áá²á·á¡áá«...
          // ð¿  áá¯áá·áºáá½ááºáá¬á¸áá¼áá²á·á¡áá«...
          // ð¿ áá»á¾á±á¬ááºáááºáá²á·á¡áá«áá­á¯ááºá¸
          // â   ðð¢ð§ðð² áá­á¯ ááá­ááá­á¯ááºáá«áá±á¬áº  â ''',
          //     image: buildImage('assets/2.png'),
          //     decoration: getPageDecoration(),
          //   ),
          //   PageViewModel(
          //     title: "EVERYTIME YOU WILL NEED MY CINDY",
          //     body: '''
          // ð§  áá­á¯á¸áá±á¸ááá²áá½á¬....
          // ð¨  áá±áá±á¸ááá²áá­á¯ááº....
          // ð¤  áá¬áááºáá¼á®á¸ á¡áá¼ááºáá½ááºáááá²áá±á¬áº â''',
          //     image: buildImage('assets/4.png'),
          //     decoration: getPageDecoration(),
          //   ),
          PageViewModel(
            title: 'ð¹ Hammies Mandalian ð¹',
            body: '''â  Hamster Food and Accessories âáá»á­á¯á¸áá¯á¶áá­á¯

áááºáá±áá¬áááºá¸áá¾á¬ áá­áá­áá­ááºáá¼á­á¯ááº

áááºáá°áá­á¯ááºáá«áá¼á®  â ''',
            footer: ButtonWidget(
              text: "LET'S GET STARTED",
              onClicked: () => goToHome(context),
            ),
           image: buildImage('assets/icons/2.png'),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text("", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text(
          'SKIP',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        ),
        onSkip: () => goToHome(context),
        next: Icon(Icons.forward_outlined, size: 30, color: Colors.orange),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.white,
        skipFlex: 0,
        nextFlex: 0,
        isProgressTap: true,
        isProgress: true,
        showNextButton: true,
        // freeze: true,
        animationDuration: 100,
      );

  void goToHome(context) => Get.offNamed(homeScreen);//Get.offNamed(redirectRoute());

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 400));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.indigo,
        activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 18),
        titlePadding: EdgeInsets.only(top: 0),
        descriptionPadding: EdgeInsets.only(top: 20).copyWith(bottom: 0),
        // imagePadding: EdgeInsets.only(top: 100),
        pageColor: Colors.white,
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Colors.orange,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
