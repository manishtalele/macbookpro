import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class DutyBookViewList extends StatefulWidget {
  const DutyBookViewList({super.key});

  @override
  State<DutyBookViewList> createState() => _DutyBookViewListState();
}

class _DutyBookViewListState extends State<DutyBookViewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Duty Book",
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
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: sizeWidth,
                          // height: sizeWidth * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: AllColor.black.withOpacity(0.5))),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // sizeBoxHeight(),
                                  textKeyValue(
                                      textKey: "Name",
                                      textValue: "GIRIDHAR GORE"),
                                  textKeyValue(
                                      textKey: "Duty Name", textValue: "Other"),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: bigText18("Allocated Duty Time",
                                        color: AllColor.primaryColor),
                                  ),
                                  textKeyValue(
                                      textKey: "Allcoated From",
                                      textValue: "NA"),
                                  textKeyValue(
                                      textKey: "Allocated To", textValue: "NA"),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: bigText18("Duty Time",
                                        color: AllColor.primaryColor),
                                  ),
                                  textKeyValue(
                                      textKey: "On Duty from",
                                      textValue: "13:56"),
                                  textKeyValue(
                                      textKey: "On Duty To",
                                      textValue: "13:56"),
                                  textKeyValue(
                                      textKey: "Total hours",
                                      textValue: "13:56"),
                                  // sizeBoxHeight(3),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  // color: AllColor.blue,
                                  height: 240,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            width: sizeWidth * 0.25,
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                color: AllColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: AllColor.black
                                                        .withOpacity(0.5))),
                                            child: Center(
                                              child: madiumText15(
                                                "View",
                                                color: AllColor.white,
                                              ),
                                            )),
                                      ),
                                      // Spacer(),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            width: sizeWidth * 0.25,
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                color: AllColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: AllColor.black
                                                        .withOpacity(0.5))),
                                            child: Center(
                                              child: madiumText15(
                                                "Edit",
                                                color: AllColor.white,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }

  Padding textKeyValue({textKey, textValue}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          bigText18(textKey ?? ""),
          bigText18(" : "),
          madiumText15(textValue ?? "")
        ],
      ),
    );
  }
}
