import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/utils/dateFormatter/dateFormater.dart';
import 'package:m_police01_02_24/view/screen/dutybookScreen/dutyBookViewList.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> Unitlist = <String>[
  'Select Unit',
  'CBD BELAPUR PS',
  'KHANDESHWAE',
];

const List<String> SelectDutylist = <String>[
  'Select Duty',
  'Other',
];

class DutyBookScreen extends StatefulWidget {
  const DutyBookScreen({super.key});

  @override
  State<DutyBookScreen> createState() => _DutyBookScreenState();
}

class _DutyBookScreenState extends State<DutyBookScreen> {
  DateTime? selectedDate;
  bool selectedADD = false;

  String dropdownValue = Unitlist.first;
  String dropdownValueDuty = SelectDutylist.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Duty Book",
                fontweignt: FontWeight.bold, color: AllColor.white),
            centerTitle: false, onPressed: () {
          Navigator.pop(context);
        }, onPressed1: () {}, onPressed2: () {}),
        body: SizedBox(
          width: sizeWidth,
          height: sizeHeight,
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
                  //  labelColor: Colors.red,
                  // dividerColor: Colors.black,
                  tabs: [
                    Tab(
                        child: Container(
                      width: sizeWidth,
                      child: Center(
                        child: TextSize20("Duty Book Entry",
                            color: AllColor.white),
                      ),
                    )),
                    Tab(
                        child: Container(
                      width: sizeWidth,
                      child: Center(
                        child: TextSize20("Duty Book Details",
                            color: AllColor.white),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: <Widget>[
                  !selectedADD ? dutyBookEntry() : selectedDutyForm(),
                  dutyBookDetails()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dutyBookDetails() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: madiumText15("Select Unit"),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  value: dropdownValue,
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
                      dropdownValue = value!;
                    });
                  },
                  items: Unitlist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: madiumText15(value));
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        sizeBoxHeight(8),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: madiumText15("Select Sub Unit"),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  value: dropdownValue,
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
                      // dropdownValue = value!;
                    });
                  },
                  items: Unitlist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: madiumText15(value));
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              madiumText15("Employee Details", color: AllColor.primaryColor),
              const Spacer(),
              madiumText15("Action", color: AllColor.primaryColor),
            ],
          ),
        ),
        Expanded(child: EmployeeDetailListView()

            // ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     itemCount: 12,
            //     itemBuilder: (BuildContext context, index) {
            //       log(index.toString());
            //       return Container(
            //         padding: EdgeInsets.symmetric(horizontal: 8.0),
            //         height: 60,
            //         child: Card(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(5.0)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Container(
            //                 width: sizeWidth * 0.7,
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: 8.0),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       madiumText15("SHAMBHAJI GADHE(PC/APC)",
            //                           color: AllColor.primaryColor),
            //                       madiumText15("DGPVHPM8605",
            //                           color: AllColor.primaryColor),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Spacer(),
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                     width: sizeWidth * 0.2,
            //                     height: 42,
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 10.0),
            //                     decoration: BoxDecoration(
            //                         color: AllColor.primaryColor,
            //                         borderRadius: BorderRadius.circular(6),
            //                         border: Border.all(
            //                             color:
            //                                 AllColor.black.withOpacity(0.5))),
            //                     child: Center(
            //                       child: madiumText15(
            //                         "View",
            //                         color: AllColor.white,
            //                       ),
            //                     )),
            //               ),
            //               sizeBoxWidth(5)
            //             ],
            //           ),
            //         ),
            //       );
            //     })

            ),
        sizeBoxHeight(5),
      ],
    );
  }

  selectedDutyForm() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  value: dropdownValueDuty,
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
                      dropdownValueDuty = value!;
                    });
                  },
                  items: SelectDutylist.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: madiumText15(value));
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        commonDutyTimeFromTo(
          textName: "Time From" + " " + ":",
          // ignore: unnecessary_null_comparison
          textA: selectedFromTime != null
              ? "${selectedFromTime.hour}:${selectedFromTime.minute}"
              : "Select Time",
          onTap: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: selectedFromTime,
            );

            if (time != null) {
              setState(() {
                selectedFromTime = time;
                calculateDifference(selectedFromTime, selectedToTime);
              });
            }
          },
        ),
        commonDutyTimeFromTo(
          textName: "Time To" + " " + ":",
          // ignore: unnecessary_null_comparison
          textA: selectedToTime != null
              ? "${selectedToTime.hour}:${selectedToTime.minute}"
              : "Select Time",
          onTap: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: selectedToTime,
            );

            if (time != null) {
              setState(() {
                selectedToTime = time;
                calculateDifference(selectedFromTime, selectedToTime);
              });
            }
          },
        ),
        commonDutyTimeFromTo(
            textName: "Total hours" + " " + ":",
            textA: difference,
            boolCalendr: true),
        commonDutyDescription(
          textName: "Description",
        ),
        sizeBoxHeight(10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedADD = false;
                  });
                  log(selectedADD.toString());
                },
                child: Container(
                    width: sizeWidth * 0.3,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "Cancel",
                        color: AllColor.white,
                      ),
                    )),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                    width: sizeWidth * 0.3,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "Save",
                        color: AllColor.white,
                      ),
                    )),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                    width: sizeWidth * 0.3,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "Submit",
                        color: AllColor.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TimeOfDay selectedFromTime = TimeOfDay.now();
  TimeOfDay selectedToTime = TimeOfDay.now();
  String difference = '';

  void calculateDifference(TimeOfDay? fromTime, TimeOfDay? toTime) {
    if (fromTime != null && toTime != null) {
      int fromMinutes = fromTime.hour * 60 + fromTime.minute;
      int toMinutes = toTime.hour * 60 + toTime.minute;

      if (toMinutes < fromMinutes) {
        toMinutes += 24 * 60;
      }

      int differenceMinutes = (toMinutes - fromMinutes).abs();
      int hours = differenceMinutes ~/ 60;
      int minutes = differenceMinutes % 60;

      setState(() {
        difference = "$hours:$minutes";
      });
    } else {
      setState(() {
        difference = '';
      });
    }
  }

  dutyBookEntry() {
    return Column(children: [
      sizeBoxHeight(15),
      commondutyBookddata(textName: "Sevarth No", textA: "DGPGSGM7001"),
      sizeBoxHeight(5),
      commondutyBookddata(textName: "Unit", textA: "NAVI MUMBAI CITY"),
      sizeBoxHeight(5),
      commondutyBookddata(textName: "Sub Unit", textA: "CBD BELAPUR PS"),
      sizeBoxHeight(5),
      commondutyBookddata(textName: "Buckle No", textA: "NA"),
      sizeBoxHeight(5),
      commondutyBookddata(textName: "Year", textA: "2024"),
      sizeBoxHeight(5),
      commondutyBookddata(
          textName: "Date",
          textA: selectedDate.toString() != "null"
              ? formatter.format(DateTime.parse(selectedDate.toString()))
              : "Select Date",
          onTap: _selectDate,
          boolCalendr: true),
      sizeBoxHeight(20),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (selectedDate.toString() == "null") {
                  log("check toast");
                  Fluttertoast.cancel();

                  Fluttertoast.showToast(
                      msg: "Select Date",
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 18.0,
                      backgroundColor: AllColor.primaryColor);
                } else {
                  setState(() {
                    selectedADD = true;
                  });
                }

                log("selected");
              },
              child: Container(
                  width: sizeWidth * 0.45,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: AllColor.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: Center(
                    child: madiumText15(
                      "Add",
                      color: AllColor.white,
                    ),
                  )),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => DutyBookViewList()));
              },
              child: Container(
                  width: sizeWidth * 0.45,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: AllColor.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: Center(
                    child: madiumText15(
                      "View",
                      color: AllColor.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ]);
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Padding commonDutyDescription({textName, textA, onTap}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: sizeWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sizeWidth * 0.4,
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: normalTextAppBar(textName, fontSize: 18.0),
            ),
            Container(
                width: sizeWidth * 0.45,
                alignment: Alignment.centerLeft,
                // height: 100,
                child: TextField(
                  maxLines: null,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: "Enter Description",
                    filled: true,
                    fillColor: Colors.white,
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
                ))
          ],
        ),
      ),
    );
  }

  Padding commonDutyTimeFromTo({textName, textA, onTap, boolCalendr = false}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: sizeWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: sizeWidth * 0.4,
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: normalTextAppBar(textName, fontSize: 18.0),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: sizeWidth * 0.45,
                alignment: Alignment.centerLeft,
                height: 30,
                decoration: boolCalendr
                    ? null
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AllColor.greyColor.withOpacity(0.5))),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: normalText(textA, fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox commondutyBookddata({textName, textA, onTap, boolCalendr = false}) {
    return SizedBox(
      width: sizeWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth * 0.5,
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            child: normalTextAppBar(textName, fontSize: 18.0),
          ),
          !boolCalendr
              ? Container(
                  width: sizeWidth * 0.5,
                  padding: EdgeInsets.only(right: 8),
                  child: TextSize25(textA,
                      fontSize: 18.0,
                      maxline: 4,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip),
                )
              : InkWell(
                  onTap: onTap,
                  child: Container(
                      width: sizeWidth * 0.45,
                      height: 27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: AllColor.greyColor.withOpacity(0.5))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Center(
                              child: normalText(textA, fontSize: 18.0),
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
                )
        ],
      ),
    );
  }
}

class EmployeeDetailListView extends StatefulWidget {
  const EmployeeDetailListView({super.key});

  @override
  State<EmployeeDetailListView> createState() => _EmployeeDetailListViewState();
}

class _EmployeeDetailListViewState extends State<EmployeeDetailListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 12,
        itemBuilder: (BuildContext context, index) {
          log(index.toString());
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            height: 60,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: sizeWidth * 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          madiumText15("SHAMBHAJI GADHE(PC/APC)",
                              color: AllColor.primaryColor),
                          madiumText15("DGPVHPM8605",
                              color: AllColor.primaryColor),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: sizeWidth * 0.2,
                        height: 42,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: AllColor.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AllColor.black.withOpacity(0.5))),
                        child: Center(
                          child: madiumText15(
                            "View",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                  sizeBoxWidth(5)
                ],
              ),
            ),
          );
        });
  }
}
