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
const List<String> yearList = <String>['Select Year', '2022', '2023'];

class SallaryWidget extends StatefulWidget {
  const SallaryWidget({super.key});

  @override
  State<SallaryWidget> createState() => _SallaryWidgetState();
}

class _SallaryWidgetState extends State<SallaryWidget> {
  String dropdownValueMontth = monthList.first;
  String dropdownValueYear = yearList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Salary Slip",
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
          sizeBoxHeight(5),
          InkWell(
            onTap: () {},
            child: Container(
                width: sizeWidth * 0.97,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: madiumText15(
                    "PRINT",
                    color: AllColor.white,
                  ),
                )),
          ),
          sizeBoxHeight(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Container(
                  width: sizeWidth * 0.35,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: dropdownValueMontth,
                        isExpanded: false,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValueMontth = value!;
                          });
                        },
                        items: monthList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: sizeWidth * 0.34,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: dropdownValueYear,
                        isExpanded: false,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValueYear = value!;
                          });
                        },
                        items: yearList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: sizeWidth * 0.25,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: AllColor.primaryDeepColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: madiumText15(
                          "VIEW",
                          color: AllColor.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: sizeWidth,
              // height: sizeWidth,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AllColor.primaryDeepColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: bigText18("Salary Details",
                              color: AllColor.white),
                        ),
                      ),
                    ),
                    salaryDetailWidget(
                        textWidget1: "Name",
                        textWidget2: "GIRIDHAR SITARAM GORE"),
                    salaryDetailWidget(
                        textWidget1: "Sevarth/Buckle",
                        textWidget2: "DGPGSGM7001"),
                    salaryDetailWidget(
                        textWidget1: "Unit", textWidget2: "NAVI MUMBAI CITY"),
                    salaryDetailWidget(
                        textWidget1: "Sub Unit", textWidget2: "CBD BELAPUR PS"),
                    salaryDetailWidget(
                        textWidget1: "GPF/DCPS A.C.Number",
                        textWidget2: "PBMH/76485"),
                    salaryDetailWidget(textWidget1: "Remarks", textWidget2: ""),
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: Center(
                        child: madiumText15("EARNINGS", color: Colors.black54),
                      ),
                    ),
                    salaryEarnignWidget(
                        textWidget1: "Remarks", textWidget2: "78900"),
                    salaryEarnignWidget(
                        textWidget1: "CLA (5TH PAY)", textWidget2: "300"),
                    salaryEarnignWidget(
                        textWidget1: "Washing Allowance", textWidget2: "100"),
                    salaryEarnignWidget(
                        textWidget1: "Basic Arrrear", textWidget2: "60865"),
                    salaryEarnignWidget(
                        textWidget1: "7PC DA", textWidget2: "24459"),
                    salaryEarnignWidget(
                        textWidget1: "Lisence Fee", textWidget2: "580"),
                    salaryEarnignWidget(
                        textWidget1: "H.R.A(House Rent Allowance)",
                        textWidget2: "21303"),
                    salaryEarnignWidget(
                        textWidget1: "OTHER ALLOWANCE", textWidget2: "63566"),
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AllColor.green,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            madiumText15("TOTAL GROSS EARNNINNG",
                                color: AllColor.white),
                            Spacer(),
                            madiumText15("189207", color: AllColor.white),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: Center(
                        child:
                            madiumText15("DEDUCTIONS", color: Colors.black54),
                      ),
                    ),
                    salaryEarnignWidget(
                        textWidget1: "GPF_GRP_ABC", textWidget2: "15000"),
                    salaryEarnignWidget(
                        textWidget1: "Prof. Tax.", textWidget2: "200"),
                    salaryEarnignWidget(textWidget1: "GIS", textWidget2: "960"),
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AllColor.green,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            madiumText15("TOTAL DEDUCTIONS",
                                color: AllColor.white),
                            Spacer(),
                            madiumText15("77026", color: AllColor.white),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AllColor.lightorangee,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            madiumText15("NET SALARY", color: AllColor.white),
                            Spacer(),
                            madiumText15("112181", color: AllColor.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  salaryDetailWidget({textWidget1, textWidget2}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: sizeWidth * 0.35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: normalText13(
                textWidget1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          normalText13(":"),
          Container(
            padding: EdgeInsets.only(left: 5),
            width: sizeWidth * 0.5,
            alignment: Alignment.centerLeft,
            // color: AllColor.blue,
            child: normalText13(textWidget2, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }

  salaryEarnignWidget({textWidget1, textWidget2}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: sizeWidth * 0.35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: normalText13(textWidget1,
                  textAlign: TextAlign.left, fontSize: 15.0),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: 5),
            width: sizeWidth * 0.5,
            alignment: Alignment.centerRight,
            // color: AllColor.blue,
            child: normalText13(textWidget2,
                textAlign: TextAlign.right, fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
