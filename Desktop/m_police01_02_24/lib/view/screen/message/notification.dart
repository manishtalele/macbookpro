import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/utils/dateFormatter/dateFormater.dart';
import 'package:m_police01_02_24/view/screen/message/sendMessage.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  DateTime? selectedfromdate = DateTime.now();
  DateTime? selectedToDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Notifications",
                fontweignt: FontWeight.bold, color: AllColor.white),
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        const SendMessageScreen()));
              },
              child: Container(
                  width: sizeWidth,
                  height: 34,
                  // color: AllColor.lightorangee,
                  child: Center(
                    child: TextSize20("Create Message" + "+",
                        color: AllColor.primaryColor),
                  )),
            ),
            Container(
              width: sizeWidth,
              color: AllColor.primaryColor,
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  color: AllColor.lightorangee,
                ),
                tabs: [
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Unread Messages",
                          color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child:
                          madiumText15("All Messages ", color: AllColor.white),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                notificationUnreadlist(),
                notificationAllMessage()
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _selectToDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedfromdate,
      firstDate: DateTime.parse(selectedfromdate.toString()),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AllColor.primaryColor,
            ),
            // Change color of header text
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
      });
    }
  }

  void _selectFromDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedfromdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AllColor.primaryColor,
            ),
            // Change color of header text
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedfromdate) {
      setState(() {
        selectedfromdate = picked;
      });
    }
  }

  notificationAllMessage() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _selectFromDate();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigText18("From Date", fontSize: 16.0),
                    Container(
                        width: sizeWidth * 0.32,
                        height: 27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AllColor.greyColor.withOpacity(0.5))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Center(
                                child: bigText18(
                                    formatter.format(DateTime.parse(
                                        selectedfromdate.toString())),
                                    fontSize: 16.0),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.calendar_month,
                                size: 20,
                                color: AllColor.primaryColor,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _selectToDate();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigText18("To Date", fontSize: 16.0),
                    Container(
                        width: sizeWidth * 0.32,
                        height: 27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AllColor.greyColor.withOpacity(0.5))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Center(
                                child: bigText18(
                                    formatter.format(DateTime.parse(
                                        selectedToDate.toString())),
                                    fontSize: 16.0),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.calendar_month,
                                size: 20,
                                color: AllColor.primaryColor,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      width: sizeWidth * 0.25,
                      height: 30,
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: AllColor.primaryDeepColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: madiumText15(
                          "Submit",
                          color: AllColor.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(10),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: sizeWidth,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          commondateTime(
                              conntainerColor: AllColor.lightorangee,
                              textName: "Date",
                              textA: "03-11-2023",
                              textTime: "13:47:15",
                              textTime1: "Time"),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Title",
                            textA: "test",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Message",
                            textA: "Message test",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Message By",
                            textA: "GIRIDHAR SITARAM GORE on behalf",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Attachments",
                            textA: "Message gp",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  width: sizeWidth * 0.45,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: madiumText15(
                      "Previous",
                      color: AllColor.white,
                    ),
                  )),
              Spacer(),
              Container(
                  width: sizeWidth * 0.45,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: madiumText15(
                      "Next",
                      color: AllColor.white,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }

  notificationUnreadlist() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: sizeWidth,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          commondateTime(
                              conntainerColor: AllColor.lightorangee,
                              textName: "Date",
                              textA: "03-11-2023",
                              textTime: "13:47:15",
                              textTime1: "Time"),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Title",
                            textA: "test",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Message",
                            textA: "Message test",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Message By",
                            textA: "GIRIDHAR SITARAM GORE on behalf",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Attachments",
                            textA: "Message gp",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  width: sizeWidth * 0.45,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: madiumText15(
                      "Previous",
                      color: AllColor.white,
                    ),
                  )),
              Spacer(),
              Container(
                  width: sizeWidth * 0.45,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: madiumText15(
                      "Next",
                      color: AllColor.white,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }

  commonMessageTitle(
      {textName, textA, textTime1, textTime, conntainerColor, onTap}) {
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
            width: sizeWidth * 0.25,
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(":"),
          ),
          Container(
            width: sizeWidth * 0.62,
            padding: EdgeInsets.only(right: 5),
            alignment: Alignment.centerLeft,
            child: TextSize25(textA,
                fontSize: 16.0,
                maxline: 4,
                color: AllColor.black,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip),
          ),
        ],
      ),
    );
  }

  commondateTime(
      {textName, textA, textTime1, textTime, conntainerColor, onTap}) {
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
            width: sizeWidth * 0.2,
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.white),
          ),
          Container(
            width: sizeWidth * 0.3,
            padding: EdgeInsets.only(right: 5),
            alignment: Alignment.centerLeft,
            // color: AllColor.yellow,
            child: TextSize25(textA,
                fontSize: 16.0,
                maxline: 4,
                color: AllColor.white,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip),
          ),
          Spacer(),
          Container(
            width: sizeWidth * 0.15,
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textTime1,
                fontSize: 16.0, color: AllColor.white),
          ),
          Container(
            width: sizeWidth * 0.3,
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.centerLeft,
            // color: AllColor.yellow,
            child: TextSize25(textTime,
                fontSize: 16.0,
                maxline: 4,
                color: AllColor.white,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip),
          ),
        ],
      ),
    );
  }
}
