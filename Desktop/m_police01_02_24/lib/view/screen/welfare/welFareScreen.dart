import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> monthList = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class WelFareScreen extends StatefulWidget {
  const WelFareScreen({super.key});
  @override
  State<WelFareScreen> createState() => _WelFareScreenState();
}

class _WelFareScreenState extends State<WelFareScreen> {
  String dropdownValueMontth = monthList.first;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Walefare",
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
            sizeBoxHeight(1),
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
                      child:
                          madiumText15("Welfare Topic", color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Welfare History",
                          color: AllColor.white),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: <Widget>[welfareTopic(), welfareHistory()]),
            ),
          ],
        ),
      ),
    );
  }

  welfareTopic() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: bigText18("Select Subject", color: Colors.black54),
          ),
        ),
        Container(
          width: sizeWidth * 0.95,
          // height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AllColor.black.withOpacity(0.5))),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: dropdownValueMontth,
                isExpanded: false,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueMontth = value!;
                  });
                },
                items: monthList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(width: sizeWidth * 0.8, child: Text(value)),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        sizeBoxHeight(10),
        InkWell(
          onTap: () {
            setState(() {});
          },
          child: Container(
              width: sizeWidth * 0.95,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AllColor.primaryDeepColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: bigText18(
                  "SUBMIT",
                  color: AllColor.white,
                ),
              )),
        ),
      ],
    );
  }

  welfareHistory() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: SizedBox(
                width: sizeWidth * 0.6,
                height: 40,
                child: TextField(
                  // controller: searchControler,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: AllColor.backgroundTop,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    hoverColor: Color.fromRGBO(54, 54, 54, 1),
                    label: madiumText15('Enter keywords'),
                    labelStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                  width: sizeWidth * 0.35,
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: madiumText15(
                      "Search",
                      color: AllColor.white,
                    ),
                  )),
            ),
            sizeBoxWidth(8)
          ],
        ),
      ],
    );
  }
}
