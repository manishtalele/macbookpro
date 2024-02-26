import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
const List<String> listEntities = <String>['5', '10', '30', '100'];

class ActivityList extends StatefulWidget {
  const ActivityList({super.key});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  String dropdownValue = list.first;
  String dropdownValueEntity = listEntities.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(
          bigText18(AllString.activitylist,
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
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
              padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: bigText18("Employee ACR Grade"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: madiumText15(AllString.selectAcrduration + "*"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 38,
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
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
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 3.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 3.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          hoverColor: Color.fromRGBO(54, 54, 54, 1),
                          hintText: 'Select Year',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: madiumText15(AllString.selectUnit + "*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: sizeWidth,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: AllColor.black.withOpacity(0.5))),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            focusColor: AllColor.blueGrey.withOpacity(0.1),
                            value: dropdownValue,
                            isExpanded: true,
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
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
                  )
                ],
              ),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: madiumText15(AllString.fromdate + "*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                        width: sizeWidth,
                        height: 38,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: AllColor.blueGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AllColor.black.withOpacity(0.5))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: normalText("01-04-2024"),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: madiumText15(AllString.todate + "*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                        width: sizeWidth,
                        height: 38,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: AllColor.blueGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AllColor.black.withOpacity(0.5))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: normalText("01-04-2024"),
                        )),
                  )
                ],
              ),
            ),
            sizeBoxHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: sizeWidth * 0.2,
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: AllColor.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: AllColor.black.withOpacity(0.5))),
                      child: Center(
                        child: madiumText15(
                          "Submit",
                          color: AllColor.white,
                        ),
                      )),
                ),
                sizeBoxWidth(15),
                Container(
                    width: sizeWidth * 0.2,
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.blueGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "Reset",
                        color: AllColor.black,
                      ),
                    ))
              ],
            ),
            sizeBoxHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                madiumText15("Show"),
                sizeBoxWidth(4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: sizeWidth * 0.2,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: dropdownValueEntity,
                          isExpanded: false,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValueEntity = value!;
                            });
                          },
                          items: listEntities
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
                ),
                sizeBoxWidth(4),
                madiumText15("entries"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
