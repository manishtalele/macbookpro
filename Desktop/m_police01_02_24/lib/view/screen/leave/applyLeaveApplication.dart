import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/utils/dateFormatter/dateFormater.dart';
import 'package:m_police01_02_24/view/screen/leave/leaveappliAttachFileSubmit.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> leaveweeklyOffList = <String>[
  'Select weekly off',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];

const List<String> reasionTypeList = <String>[
  'मूळ गावी',
  'कौटुंबिक कार्यक्रम',
  'महाराष्ट्र दर्शन',
  'OTHER/इतर',
  'अर्जित राजेचा अर्ज'
];

class ApplyLeaveApplication extends StatefulWidget {
  const ApplyLeaveApplication({super.key});

  @override
  State<ApplyLeaveApplication> createState() => _ApplyLeaveApplicationState();
}

class _ApplyLeaveApplicationState extends State<ApplyLeaveApplication> {
  // final ScrollController _scrollController = ScrollController();
  bool isweekendareSame = false;
  String dropdownValueLeaveWeeklyOff = leaveweeklyOffList.first;
  String dropdownValueReasonType = reasionTypeList.first;
  DateTime? selectedfromdate;
  DateTime? selectedToDate;
  bool isCheckedFromdate = false;
  bool isCheckedTodate = false;
  bool value = false;
  Duration? difference;
  double firsHSecH = 0.0;

  late FToast fToast;

  // Assuming current date

  // Create an empty list to store the difference in dates
  List<String> differenceList = [];

  // Loop through the dates and add them to the list

  differenceofDateWeek() {
    differenceList.clear();
    for (DateTime date = selectedfromdate!;
        date.isBefore(selectedToDate!) ||
            date.isAtSameMomentAs(selectedToDate!);
        date = date.add(Duration(days: 1))) {
      String dayOfWeek = _getDayOfWeek(date.weekday);

      log("weekly update:-" + date.toString());
      if (dropdownValueLeaveWeeklyOff.toString() == dayOfWeek &&
          (date.toString() == selectedfromdate.toString() ||
              date.toString() == selectedToDate.toString())) {
        setState(() {
          isweekendareSame = true;
        });

        log("Booth week are same:-" +
            dropdownValueLeaveWeeklyOff.toString() +
            "----" +
            dayOfWeek.toString());
      } else {
        setState(() {
          // isweekendareSame = false;
        });

        log("Booth week are not same:-" +
            dropdownValueLeaveWeeklyOff.toString() +
            "----" +
            dayOfWeek.toString());
      }

      differenceList.add(
          "${date.day}-${_getMonthName(date.month)}-${date.year}($dayOfWeek)");

      setState(() {
        // log("list:-" + differenceList.toString());
      });
    }
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);

    // _scrollController.addListener(() {
    //   setState(() {
    //     log(_scrollController.offset.toString());
    //     log("Scroller:" +
    //         _scrollController.position.maxScrollExtent.toString());
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _scrollController.dispose();
  }

  _showToast(icon, tostText) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: AllColor.greyColor.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AllColor.primaryColor,
          ),
          SizedBox(
            width: 12.0,
          ),
          madiumText15(tostText)
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    // log("Scroller:" + _scrollController.position.maxScrollExtent.toString());
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Leave Application",
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }, onPressed1: () {}, onPressed2: () {}),
      floatingActionButton: Container(
        width: sizeWidth,
        height: 50,
        child: Stack(children: <Widget>[
          Positioned(
            left: 35,
            bottom: 0.0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: sizeWidth * 0.40,
                height: 45,
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AllColor.primaryDeepColor,
                  label: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: AllColor.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the value as needed
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: sizeWidth * 0.40,
              height: 45,
              child: FloatingActionButton.extended(
                heroTag: "btn2",
                onPressed: () {
                  isweekendareSame == true
                      ? _showToast(Icons.flutter_dash,
                          "From date allready weekenndd off")
                      : Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const LeaveApplicationAttachSubmit()));
                },
                backgroundColor: AllColor.primaryDeepColor,
                label: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: AllColor.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the value as needed
                ),
              ),
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  bigText18("*From Date", fontSize: 16.0),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      _selectDate();
                    },
                    child: Container(
                        width: sizeWidth * 0.35,
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
                                child: bigText18(
                                    selectedfromdate != null
                                        ? formatter.format(DateTime.parse(
                                            selectedfromdate.toString()))
                                        : "Select date",
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
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    value: isCheckedFromdate,
                    onChanged: (bool? value) {
                      setState(() {
                        if (selectedfromdate != null &&
                            selectedToDate != null) {
                          isCheckedTodate = false;
                          isCheckedFromdate = value!;

                          if (isCheckedFromdate == true) {
                            firstHAndSecHData(difference!);
                          } else {}
                        } else {
                          fToast.removeCustomToast();

                          _showToast(Icons.flutter_dash,
                              "Please select From Date and To Date");
                        }
                      });
                    },
                  ),
                  bigText18("2nd Half", fontSize: 16.0)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  bigText18("*To Date", fontSize: 16.0),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (selectedfromdate != null) {
                        _selectToDate();
                      } else {
                        fToast.removeCustomToast();

                        _showToast(Icons.flutter_dash, "Select From Date");
                      }
                    },
                    child: Container(
                        width: sizeWidth * 0.35,
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
                                child: bigText18(
                                    selectedToDate != null
                                        ? formatter.format(DateTime.parse(
                                            selectedToDate.toString()))
                                        : "Select date",
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
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    value: isCheckedTodate,
                    onChanged: (bool? value) {
                      setState(() {
                        if (selectedfromdate != null &&
                            selectedToDate != null) {
                          isCheckedFromdate = false;
                          isCheckedTodate = value!;

                          if (isCheckedTodate == true) {
                            firstHAndSecHData(difference!);
                          } else {}
                        } else {
                          fToast.removeCustomToast();

                          _showToast(Icons.flutter_dash,
                              "Please select From Date and To Date");
                        }
                      });
                    },
                  ),
                  bigText18("1nd Half", fontSize: 16.0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  bigText18("Total Days", fontSize: 16.0),
                  Spacer(),
                  Container(
                      width: sizeWidth * 0.62,
                      height: 27,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: AllColor.greyColor.withOpacity(0.5))),
                      child:
                          isCheckedFromdate == true || isCheckedTodate == true
                              ? bigText18(firsHSecH.toString())
                              : bigText18(
                                  difference?.inDays.toString() == "0"
                                      ? ""
                                      : difference?.inDays.toString(),
                                  fontSize: 16.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  bigText18("Select Weekly off", fontSize: 16.0),
                  Spacer(),
                  Container(
                    width: sizeWidth * 0.62,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: dropdownValueLeaveWeeklyOff,
                          isExpanded: false,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          underline: Container(
                            height: 2,
                            color: const Color.fromARGB(255, 132, 98, 225),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValueLeaveWeeklyOff = value!;
                              differenceofDateWeek();
                            });
                          },
                          items: leaveweeklyOffList
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // bigText18("Reason Type", fontSize: 16.0),
                  RichText(
                    text: TextSpan(
                      text: '* ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: AllColor.red),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Reason Type',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: sizeWidth * 0.62,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: dropdownValueReasonType,
                          isExpanded: false,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValueReasonType = value!;
                            });
                          },
                          items: reasionTypeList
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizeWidth * 0.3,
                    child: bigText18("Reason",
                        overflow: TextOverflow.clip, fontSize: 16.0),
                  ),
                  Spacer(),
                  Container(
                      width: sizeWidth * 0.62,
                      alignment: Alignment.centerLeft,
                      // decoration: BoxDecoration(
                      //     color: AllColor.red,
                      //     borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Reason",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.only(left: 5, right: 5, top: 5),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AllColor.black.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(6)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AllColor.black.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(6)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AllColor.black.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      )),
                ],
              ),
            ),

            //            DateTime? selectedfromdate;
            // DateTime? selectedToDate;
            // bool isCheckedFromdate = false;
            // bool isCheckedTodate = false;

            WeeklyCalenderList(
                differenceListWeekly: differenceList,
                selectedWeekly: dropdownValueLeaveWeeklyOff,
                fromdate: isCheckedFromdate == true
                    ? selectedfromdate.toString()
                    : isCheckedTodate == true
                        ? selectedToDate.toString()
                        : "",
                secondHalf: isCheckedFromdate == true
                    ? isCheckedFromdate
                    : isCheckedTodate == true
                        ? isCheckedTodate
                        : false,
                seconndFirst: isCheckedFromdate == true
                    ? "2"
                    : isCheckedTodate == true
                        ? "1"
                        : ""),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),

            sizeBoxHeight(50)

            // _scrollController.offset !=
            //         _scrollController.position.maxScrollExtent
            //     ? const SizedBox.expand()
            //     :

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Stack(children: <Widget>[
            //     Positioned(
            //       // left: 35,
            //       bottom: 0.0,
            //       child: Align(
            //         alignment: Alignment.bottomLeft,
            //         child: Container(
            //           width: sizeWidth * 0.40,
            //           height: 45,
            //           child: FloatingActionButton.extended(
            //             onPressed: () {},
            //             backgroundColor: AllColor.primaryDeepColor,
            //             label: Text(
            //               'Cancel',
            //               style: TextStyle(fontSize: 18, color: AllColor.white),
            //             ),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(
            //                   8.0), // Adjust the value as needed
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Align(
            //       alignment: Alignment.bottomRight,
            //       child: Container(
            //         width: sizeWidth * 0.40,
            //         height: 45,
            //         child: FloatingActionButton.extended(
            //           onPressed: () {
            //             Navigator.of(context).push(CupertinoPageRoute(
            //                 builder: (BuildContext context) => const Scrool()));
            //           },
            //           backgroundColor: AllColor.primaryDeepColor,
            //           label: Text(
            //             'Next',
            //             style: TextStyle(fontSize: 18, color: AllColor.white),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(
            //                 8.0), // Adjust the value as needed
            //           ),
            //         ),
            //       ),
            //     )
            //   ]),
            // ),
          ],
        ),
      ),
    );
  }

  differentFromTodate(fromdate, todate) {
    // log("selected2");
    DateTime selecFromDate = fromdate;

    DateTime selecToDate = todate;

    if (selecFromDate == selecToDate) {
      setState(() {
        difference = Duration(days: 1);
        firstHAndSecHData(difference!);
      });

      print('Difference in days: ${difference?.inDays}');
    } else {
      setState(() {
        difference =
            selecToDate.difference(selecFromDate) + Duration(hours: 24);
        firstHAndSecHData(difference!);
      });

      print('Difference in days: ${difference?.inDays}');
    }
  }

  void _selectToDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate,
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
        // log("Selected3:-" + selectedToDate.toString());
        differenceList.clear();
        differenceofDateWeek();

        differentFromTodate(selectedfromdate, selectedToDate);
      });
    }
  }

  bool isFromDateGreaterThanToDate(DateTime fromDate, DateTime toDate) {
    return fromDate.isAfter(toDate);
  }

  isFromDateGreaterThanToDateCleardata(bool isTRUEFALSE) {
    // log("isTRUEFALSE:-" + isTRUEFALSE.toString());
    // Future<void> _showMyDialog() async {
    return isTRUEFALSE
        ? showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        'To Date should be greater than From Date',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Ok',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        selectedfromdate = null;
                        selectedToDate = null;
                        isCheckedFromdate = false;
                        isCheckedTodate = false;
                        value = false;
                        // Duration? difference;
                        firsHSecH = 0.0;
                      });
                    },
                  ),
                ],
              );
            },
          )
        : SizedBox();
  }

  firstHAndSecHData(Duration difference) {
    setState(() {
      int durationDifferenceInDays = int.parse(difference.inDays.toString());

      firsHSecH = double.parse(durationDifferenceInDays.toString()) - 0.5;

      // log("check1:-" + difference.inDays.toString());

      // log("firsHSecH:-" + firsHSecH.toString());
      // Duration durationDifferenceInHours = Duration(
      //     hours: durationDifferenceInDays * 24);

      // difference = (difference! - Duration(hours: 6));
    });
  }

  void _selectDate() async {
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
        if (selectedToDate != null) {
          differenceList.clear();
          differenceofDateWeek();
          isFromDateGreaterThanToDateCleardata(
              isFromDateGreaterThanToDate(selectedfromdate!, selectedToDate!));

          differentFromTodate(selectedfromdate, selectedToDate);
        }
      });
    }
  }
}

class WeeklyCalenderList extends StatefulWidget {
  final List<String> differenceListWeekly;
  final String selectedWeekly;
  final String? fromdate;
  final String seconndFirst;

  final bool secondHalf;
  const WeeklyCalenderList(
      {super.key,
      required this.differenceListWeekly,
      required this.selectedWeekly,
      this.fromdate,
      // = "2024-02-16 00:00:00.000",
      required this.secondHalf,
      required this.seconndFirst});

  @override
  State<WeeklyCalenderList> createState() => _WeeklyCalenderListState();
}

class _WeeklyCalenderListState extends State<WeeklyCalenderList> {
  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      // BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.differenceListWeekly.length,
      itemBuilder: (BuildContext context, int index) {
        String item = widget.differenceListWeekly[index];

        // String formattedDate = DateFormat('dd-MMM-yyyy')
        //     .format(widget.fromdate); // Format the date
        // int weekNumber = getWeekNumber(date);

        // bool isSelectWeekfromorTodate = false;

        // if (item.contains(widget.selectedWeekly) == true &&
        //     widget.differenceListWeekly[1]) {}

        DateTime? date;

        if (widget.fromdate!.isNotEmpty) {
          date = DateTime.parse(
              // '2023-02-16 00:00:00.000'
              widget.fromdate.toString());
        } else {
          log(date.toString());
        }

        return Padding(
            padding: const EdgeInsets.only(
                right: 5.0, left: 15.0, top: 3, bottom: 3),
            child: Container(
              width: sizeWidth,
              alignment: Alignment.centerLeft,
              child: date != null
                  ? item.contains(
                              "${date.day}-${_getMonthName(date.month)}-${date.year}") &&
                          widget.secondHalf
                      ? Text(
                          widget.seconndFirst == "2"
                              ? item + " (Second Half)"
                              : widget.seconndFirst == "1"
                                  ? item + " (First Half)"
                                  : item,
                          style: TextStyle(
                            fontSize: 15,
                            color: item.contains(widget.selectedWeekly)
                                ? Colors.blue
                                : Colors.black,
                          ),
                        )
                      : Text(
                          item,
                          style: TextStyle(
                            fontSize: 15,
                            color: item.contains(widget.selectedWeekly)
                                ? Colors.blue
                                : Colors.black,
                          ),
                        )
                  : Text(
                      item,
                      style: TextStyle(
                        fontSize: 15,
                        color: item.contains(widget.selectedWeekly)
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
            ));
      },
    );
  }
}
