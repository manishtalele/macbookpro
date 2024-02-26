import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

const List<String> SelectLeaveunitlist = <String>[
  'CBD BELAPUR PS',
  'KHANDESHWAR PS'
];

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({super.key});

  @override
  State<LeaveApplication> createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  String dropdownValueLeaveUnnit = SelectLeaveunitlist.first;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: sizeWidth,
                height: 42,
                // color: AllColor.lightorangee,
                child: Center(
                  child: madiumText15(
                      "Leave Application(Supervisor)\n रजा मंजुरी",
                      color: AllColor.primaryDeepColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: sizeWidth,
                alignment: Alignment.centerLeft,
                // height: 30,
                // color: AllColor.lightorangee,
                child:
                    bigText18("Select Unit", color: AllColor.primaryDeepColor)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: sizeWidth,
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AllColor.black.withOpacity(0.5))),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    focusColor: AllColor.blueGrey.withOpacity(0.1),
                    value: dropdownValueLeaveUnnit,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValueLeaveUnnit = value!;
                      });
                    },
                    items: SelectLeaveunitlist.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: madiumText15(value));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
