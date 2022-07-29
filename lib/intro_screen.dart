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
            title: "🐹 Hammies Mandalian 🐹 မှ",
            body: '''နွေးထွေးစွာ ကြိုဆိုလိုက်ပါတယ် 🇲🇲 ''',
            image: buildImage('assets/icons/1.png'),
            decoration: getPageDecoration(),
          ),
//             PageViewModel(
//               title: "Hammies Mandalian Accessories & Food",
//               body: '''
//           🐹Hammies Mandalian 🐹
//
// “ Hamster Food and Accessories “မျိုးစုံကို
//
// တစ်နေရာတည်းမှာ မိမိစိတ်ကြိုက်
//
// ဝယ်ယူနိုင်ပါပြီ ”''',
//               image: buildImage('assets/2.jpeg'),
//               decoration: getPageDecoration(),
//             ),
          //   PageViewModel(
          //     title: 'EVERYTIME YOU WILL NEED MY CINDY',
          //     body: '''
          // 🌿  ခရီးထွက်ကြတဲ့အခါ...
          // 🌿  Shopping ထွကိကြတဲ့အခါ...
          // 🌿  မုန့်ထွက်စားကြတဲ့အခါ...
          // 🌿 လျှောက်လည်တဲ့အခါတိုင်း
          // ❝   𝐂𝐢𝐧𝐝𝐲 ကို သတိရလိုက်ပါနော်  ❞ ''',
          //     image: buildImage('assets/2.png'),
          //     decoration: getPageDecoration(),
          //   ),
          //   PageViewModel(
          //     title: "EVERYTIME YOU WILL NEED MY CINDY",
          //     body: '''
          // 🌧  မိုးလေးကလဲရွာ....
          // 💨  လေလေးကလဲတိုက်....
          // 🤔  ဘာဝတ်ပြီး အပြင်ထွက်ရမလဲနော် ❓''',
          //     image: buildImage('assets/4.png'),
          //     decoration: getPageDecoration(),
          //   ),
          PageViewModel(
            title: '🐹 Hammies Mandalian 🐹',
            body: '''❝  Hamster Food and Accessories “မျိုးစုံကို

တစ်နေရာတည်းမှာ မိမိစိတ်ကြိုက်

ဝယ်ယူနိုင်ပါပြီ  ❞ ''',
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

  void goToHome(context) => Get.offNamed(redirectRoute());

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
