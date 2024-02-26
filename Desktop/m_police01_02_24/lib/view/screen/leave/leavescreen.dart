import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/leave/leaveApplication.dart';
import 'package:m_police01_02_24/view/screen/leave/leaveApplicationSelf.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Container(
              width: sizeWidth,
              height: 34,
              color: AllColor.lightorangee,
              child: Center(
                child: madiumText15(AllString.giridharShitaram,
                    color: AllColor.white),
              )),
          Container(
              width: sizeWidth,
              height: 32,
              // color: AllColor.lightorangee,
              child: Center(
                child: bigText18(AllString.leavemodule,
                    color: AllColor.primaryDeepColor),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => LeaveApplicationSelf()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: sizeWidth,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: AllColor.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: Center(
                    child: madiumText15(
                      "Leave Application(Self)\n राजेंचा अर्ज",
                      color: AllColor.white,
                    ),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => LeaveApplication()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: sizeWidth,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: AllColor.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: Center(
                    child: madiumText15(
                      "Leave Application(Self)\n रजा मंजुरी ( 6 )",
                      color: AllColor.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
