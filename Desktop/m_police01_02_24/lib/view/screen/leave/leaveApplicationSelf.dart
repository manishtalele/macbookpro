import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/leave/applyLeaveApplication.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class LeaveApplicationSelf extends StatefulWidget {
  const LeaveApplicationSelf({super.key});
  @override
  State<LeaveApplicationSelf> createState() => _LeaveApplicationSelfState();
}

class _LeaveApplicationSelfState extends State<LeaveApplicationSelf> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Leave Application",
                fontweignt: FontWeight.bold, color: AllColor.white),
            centerTitle: false, onPressed: () {
          Navigator.pop(context);
        }, onPressed1: () {}, onPressed2: () {}),
        body: SingleChildScrollView(
          child: SizedBox(
            width: sizeWidth,
            height: sizeHeight,
            child: Column(
              children: [
                Container(
                  width: sizeWidth,
                  color: AllColor.primaryColor,
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AllColor.lightorangee,
                    ),
                    //  labelColor: Colors.red,
                    // dividerColor: Colors.black,
                    tabs: [
                      Tab(
                          child: Container(
                        width: sizeWidth,
                        child: Center(
                          child: madiumText15("Leave Balance",
                              color: AllColor.white),
                        ),
                      )),
                      Tab(
                          child: Container(
                        width: sizeWidth,
                        child: Center(
                          child: madiumText15("Leave History",
                              color: AllColor.white),
                        ),
                      )),
                      Tab(
                          child: Container(
                        width: sizeWidth,
                        child: Center(
                          child: madiumText15("Track Leave",
                              color: AllColor.white),
                        ),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: <Widget>[
                    leaveBalance(),
                    LeaveHistorylist(),
                    trackLeave()
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  trackLeave() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: sizeWidth * 0.62,
                alignment: Alignment.centerLeft,
                height: 45,
                child: Center(
                  child: TextField(
                    textAlign:
                        TextAlign.center, // Align text in TextField to center
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: "Application number",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AllColor.primaryColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AllColor.greyColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AllColor.greyColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                  width: sizeWidth * 0.32,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: TextSize20(
                      "Track",
                      color: AllColor.white,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }

  LeaveHistorylist() {
    return ListView.builder(itemBuilder: (BuildContext context, index) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: sizeWidth,
          // height: sizeWidth * 0.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                commonLeaveHisWeeklyoff(
                    conntainerColor: AllColor.lightorangee,
                    textName: "Leave Type",
                    textA: "Weekly off"),
                commonLeaveHisWeeklyoff2(
                    textName: "Transaction Id",
                    textA: "NMC/LEAVE/24/000123",
                    textSize25Color: AllColor.primaryColor),
                commonLeaveHisWeeklyoff3(
                    textName: "FROM Date",
                    textA: "04-02-2024",
                    textSize25Color: AllColor.lightorangee),
                commonLeaveHisWeeklyoff2(
                    textName: "To Date",
                    textA: "04-02-2024",
                    textSize25Color: AllColor.lightorangee),
                commonLeaveHisWeeklyoff2(
                    textName: "Total Days",
                    textA: "1.0",
                    textSize25Color: AllColor.primaryColor),
                commonLeaveHisWeeklyoff4(
                  textName: "Applied Date",
                  textA: "02-02-2024",
                  textSize25Color: AllColor.black.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  applicationSourceText(
      {String AppNName = "",
      TextEditingController? conntrolerText,
      lebelText}) {
    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 6, bottom: 4),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child:
        //         madiumText15(AppNName, color: AllColor.black.withOpacity(0.7)),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 38,
            child: TextField(
              controller: conntrolerText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AllColor.backgroundTop,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: lebelText,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hoverColor: Color.fromRGBO(54, 54, 54, 1),
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  leaveBalance() {
    return Column(children: [
      sizeBoxHeight(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: sizeWidth * 0.32,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AllColor.lightorangee,
                borderRadius: BorderRadius.circular(6),
                // border: Border.all(color: AllColor.black.withOpacity(0.5)
                // )
              ),
              child: Center(
                child: madiumText15(
                  "Type",
                  color: AllColor.white,
                ),
              )),
          Container(
              width: sizeWidth * 0.32,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AllColor.lightorangee,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: madiumText15(
                  "Balance",
                  color: AllColor.white,
                ),
              )),
          Container(
              width: sizeWidth * 0.32,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AllColor.lightorangee,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: madiumText15(
                  "Apply",
                  color: AllColor.white,
                ),
              )),
        ],
      ),
      sizeBoxHeight(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: sizeWidth * 0.32,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AllColor.primaryColor,
                  )),
              child: Center(
                  child: SizedBox(
                width: sizeWidth * 0.25,
                child: madiumText15(
                  "EARNED LEAVE/अर्जित रजा",
                  overflow: TextOverflow.clip,
                  maxline: 3,
                  color: AllColor.black,
                ),
              ))),
          Container(
              width: sizeWidth * 0.3,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AllColor.primaryColor,
                  )),
              child: Center(
                child: madiumText15(
                  "15.0",
                  maxline: 2,
                  color: AllColor.black,
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => ApplyLeaveApplication()));
            },
            child: Container(
                width: sizeWidth * 0.3,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: madiumText15(
                    "Apply",
                    color: AllColor.white,
                  ),
                )),
          ),
        ],
      ),
      sizeBoxHeight(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: sizeWidth * 0.32,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AllColor.primaryColor,
                  )),
              child: Center(
                  child: SizedBox(
                width: sizeWidth * 0.3,
                child: madiumText15(
                  "Medical Leave/वैधकीय रजा",
                  overflow: TextOverflow.clip,
                  maxline: 3,
                  color: AllColor.black,
                ),
              ))),
          Container(
              width: sizeWidth * 0.3,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AllColor.primaryColor,
                  )),
              child: Center(
                child: madiumText15(
                  "10.0",
                  maxline: 2,
                  color: AllColor.black,
                ),
              )),
          Container(
              width: sizeWidth * 0.3,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AllColor.primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: madiumText15(
                  "Apply",
                  color: AllColor.white,
                ),
              )),
        ],
      ),
    ]);
  }

  commonLeaveHisWeeklyoff4(
      {textName, textA, textSize25Color, conntainerColor, onTap}) {
    return Container(
      width: sizeWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth * 0.35,
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.black.withOpacity(0.6)),
          ),
          Container(
              width: sizeWidth * 0.58,
              padding: EdgeInsets.only(right: 8),
              alignment: Alignment.centerLeft,
              // color: AllColor.yellow,
              child: Row(
                children: [
                  TextSize25(textA,
                      fontSize: 16.0,
                      maxline: 4,
                      color: textSize25Color ?? AllColor.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip),
                  Spacer(),
                  TextSize25("13:55:07",
                      fontSize: 16.0,
                      maxline: 4,
                      color: AllColor.black.withOpacity(0.7),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip),
                ],
              ))
        ],
      ),
    );
  }

  commonLeaveHisWeeklyoff2(
      {textName, textA, textSize25Color, conntainerColor, onTap}) {
    return Container(
      width: sizeWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth * 0.35,
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.black.withOpacity(0.6)),
          ),
          Container(
            width: sizeWidth * 0.58,
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.yellow,
            child: TextSize25(textA,
                fontSize: 16.0,
                maxline: 4,
                color: textSize25Color ?? AllColor.black,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip),
          )
        ],
      ),
    );
  }

  commonLeaveHisWeeklyoff3(
      {textName, textA, textSize25Color, conntainerColor, onTap}) {
    return Container(
      width: sizeWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth * 0.35,
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.black.withOpacity(0.6)),
          ),
          Container(
              width: sizeWidth * 0.58,
              padding: EdgeInsets.only(right: 8),
              alignment: Alignment.centerLeft,
              // color: AllColor.yellow,
              child: Row(
                children: [
                  TextSize25(textA,
                      fontSize: 16.0,
                      maxline: 4,
                      color: textSize25Color ?? AllColor.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip),
                  Spacer(),
                  TextSize25("Track",
                      fontSize: 16.0,
                      maxline: 4,
                      color: AllColor.black.withOpacity(0.7),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip),
                  Icon(
                    Icons.history,
                    color: AllColor.black.withOpacity(0.7),
                  )
                ],
              ))
        ],
      ),
    );
  }

  commonLeaveHisWeeklyoff({textName, textA, conntainerColor, onTap}) {
    return Container(
      width: sizeWidth,
      decoration: BoxDecoration(
          color: AllColor.lightorangee,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth * 0.35,
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.white),
          ),
          Container(
            width: sizeWidth * 0.58,
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.yellow,
            child: TextSize25(textA,
                fontSize: 16.0,
                maxline: 4,
                color: AllColor.white,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip),
          )
        ],
      ),
    );
  }
}
