import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class DailyBulletin extends StatefulWidget {
  const DailyBulletin({super.key});

  @override
  State<DailyBulletin> createState() => _DailyBulletinState();
}

class _DailyBulletinState extends State<DailyBulletin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AllColor.red,
      appBar: customPSBAppBar(
          reachTextWidget(
              text1: "m-",
              fontWText1: FontWeight.bold,
              fontText1: 21.0,
              text2: "POLICE",
              fontWText2: FontWeight.bold,
              ColorText2: AllColor.lightorangee,
              fontText2: 24.0),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }, onPressed1: () {}, onPressed2: () {}),
      bottomSheet: Container(
          width: sizeWidth,
          height: 30,
          color: AllColor.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: normalText("Powered By @ Sanpri Technologies",
                  fontweignt: FontWeight.bold, color: AllColor.primaryColor),
            ),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: sizeWidth,
                height: 34,
                color: AllColor.lightorangee,
                child: Center(
                  child: madiumText15(AllString.giridharShitaram,
                      color: AllColor.white),
                )),
            Row(
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return AllColor.primaryColor;
                        }),
                        value: AllString.radioBTNOwn,
                        groupValue: _radioValue1,
                        onChanged: handleRadioValueChange1,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          handleRadioValueChange1(AllString.radioBTNOwn);
                        },
                        child: TextSize20(AllString.radioBTNOwn))
                  ],
                ),
                sizeBoxWidth(100.0),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return AllColor.primaryColor;
                        }),
                        value: AllString.radioBTNall,
                        groupValue: _radioValue1,
                        onChanged: handleRadioValueChange1,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          handleRadioValueChange1(AllString.radioBTNall);
                        },
                        child: TextSize20(AllString.radioBTNall))
                  ],
                ),
              ],
            ),
            Container(
              height: sizeHeight,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchBox(),
                    bigText18("Daily Bulletin News Paper Cutting"),
                    Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // Align(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: bigText18("Daily Bulletin News"),
                                  // ),
                                  Container(
                                    width: sizeWidth * 0.9,
                                    height: sizeHeight * 0.2,
                                    color: AllColor.green,
                                    child: Image.network(
                                      "https://st.adda247.com/https://www.careerpower.in/blog/wp-content/uploads/2023/08/24115256/MP-POLICE-CONSTABLE-ANSWER-KEY-2023.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: normalText("13-01-2024"),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: normalText("NAVI MUMBAI ADMIN"),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: normalText("NAVI MUMBAI CITY"),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Column searchBox({search = "Search", searchOnTap, searchControler}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: madiumText15(search,
                color: AllColor.black, fontweignt: FontWeight.normal)),
        sizeBoxHeight(10),
        Row(
          children: [
            SizedBox(
              width: sizeWidth * 0.6,
              height: 30,
              child: TextField(
                controller: searchControler,
                cursorHeight: 20,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.
                      // zero,
                      only(left: 10, top: 3),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AllColor.backgroundTop, width: 2),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AllColor.backgroundTop, width: 2),
                    // border: Border.all(color: AllColor.black,width: 2)
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            sizeBoxWidth(6.0),
            InkWell(
              onTap: searchOnTap,
              child: Container(
                  width: sizeWidth * 0.2,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AllColor.greyColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: AllColor.black, width: 2)),
                  child: Center(
                    child: madiumText15(search,
                        color: AllColor.black, fontweignt: FontWeight.normal),
                  )),
            )
          ],
        )
      ],
    );
  }

  String _radioValue1 = AllString.radioBTNOwn;

  void handleRadioValueChange1(value) {
    setState(() {
      log(value.toString());
      _radioValue1 = value;
    });
  }
}
