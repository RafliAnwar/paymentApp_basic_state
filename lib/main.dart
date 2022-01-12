import 'package:flutter/material.dart';
import 'package:payment_basicstate/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onDoubleTap: (){
          setState(() {
            selectedIndex = -1;
          });
        },
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selectedIndex == index
                    ? Color(0xff007DFF)
                    : Color(0xff4D5B7C),
              )),
          child: Column(
            children: [
              Row(
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/round2.png',
                          width: 18,
                        )
                      : Image.asset(
                          'assets/round.png',
                          width: 18,
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: planTitleTextSyle,
                        ),
                        Text(
                          subTitle,
                          style: descTitleTextSyle,
                        )
                      ],
                    ),
                  ),
                  Text(
                    pricing,
                    style: priceTitleTextSyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(71),
                    ),
                    backgroundColor: Color(0xff007DFF)),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: btnTitleTextSyle,
                )),
          ),
        ],
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.only(left: 32, top: 50, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/illustration.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade To',
                  style: titleTextSyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleTextSyle.copyWith(color: Color(0xff007DFF)),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all feature and\nbuild your own business bigger',
              style: subTitleTextSyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: ListView(
          children: [
            header(),
            option(0, 'Monthly', 'Good for starting up', '\$20'),
            option(1, 'Quarterly', 'Focusing on building', '\$55'),
            option(2, 'Yearly', 'Steady company', '\$220'),
            SizedBox(
              height: 50,
            ),
            selectedIndex == -1 ? Container() : checkoutButton(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
