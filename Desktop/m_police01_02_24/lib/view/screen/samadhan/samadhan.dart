import 'dart:developer';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/utils/dateFormatter/dateFormater.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> SelectORTypeList = <String>[
  'Select Title',
  'Establishment OR',
  'Account OR',
  'Other Reason OR',
  'transfer OR',
  'Adminnistration'
];

class SamaDhanScreen extends StatefulWidget {
  const SamaDhanScreen({super.key});

  @override
  State<SamaDhanScreen> createState() => _SamaDhanScreenState();
}

class _SamaDhanScreenState extends State<SamaDhanScreen> {
  DateTime? selectedDate;

  TextEditingController dateConntroler = TextEditingController();
  String dropdownValueORT = SelectORTypeList.first;
  bool isticketsubmited = false;
  final List<String> items = [
    'Accounnt',
    'Correspondence',
    'Departmental Enquiry',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateConntroler.text =
        formatter.format(DateTime.parse(DateTime.now().toString()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Samadhan",
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
                      child: madiumText15("Apply", color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("History", color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Track", color: AllColor.white),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                isticketsubmited == false ? applyWidget1() : applyWidget2(),
                historyWidgets(),
                trackwidget()
              ]),
            ),
          ],
        ),
      ),
    );
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
        dateConntroler.text =
            formatter.format(DateTime.parse(selectedDate.toString()));
      });
    }
  }

  applyWidget1() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          sizeBoxHeight(10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Divider(
              thickness: 0.5,
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: madiumText15("Ticket Title"),
            ),
          ),
          Container(
            width: sizeWidth * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black45)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select Title',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: madiumText15("subject"),
            ),
          ),
          Container(
            width: sizeWidth * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black45)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select Subject',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),

                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
          sizeBoxHeight(30.0),
          InkWell(
            onTap: () {
              setState(() {
                isticketsubmited = !isticketsubmited;
              });
            },
            child: Container(
                width: sizeWidth * 0.45,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          sizeBoxHeight(15.0),
        ],
      ),
    );
  }

  employnnamedesigna({String texthead = "", String textHint = ""}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: madiumText15(texthead),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: SizedBox(
            width: sizeWidth * 0.95,
            height: 40,
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AllColor.backgroundTop,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hoverColor: Color.fromRGBO(54, 54, 54, 1),
                hintText: textHint,
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

  List<File> _imageFiles = [];
  ImagePicker picker = ImagePicker();
  imagePickerFromGaCa(source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });

      log("check image file:-" + _imageFiles.toString());
    }
  }

  applyWidget2() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          sizeBoxHeight(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextSize25("PFC Other"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(
              thickness: 0.5,
            ),
          ),
          employnnamedesigna(
              texthead: "Employee Name", textHint: 'GIRIDHAR SITARAM GORE'),
          sizeBoxHeight(5),
          employnnamedesigna(texthead: "Designation", textHint: 'PI'),
          sizeBoxHeight(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: madiumText15("Date*"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: SizedBox(
              width: sizeWidth * 0.95,
              height: 40,
              child: TextField(
                controller: dateConntroler,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: AllColor.primaryDeepColor,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    hoverColor: Color.fromRGBO(54, 54, 54, 1),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {
                          _selectDate();
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: AllColor.primaryColor,
                        ))),
              ),
            ),
          ),
          sizeBoxHeight(5),
          employnnamedesigna(texthead: "Other Title*", textHint: ''),
          sizeBoxHeight(5),
          employnnamedesigna(texthead: "Description"),
          sizeBoxHeight(5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: madiumText15("Attachments"),
            ),
          ),
          InkWell(
            onTap: () {
              showDialogBox();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: AllColor.black)),
                      child: Center(
                        child: normalText("Choose Files"),
                      )),
                  sizeBoxWidth(8),
                  madiumText15("No file chosen")
                ],
              ),
            ),
          ),
          sizeBoxHeight(20),
          InkWell(
            onTap: () {
              setState(() {
                isticketsubmited = !isticketsubmited;
              });
            },
            child: Container(
                width: sizeWidth * 0.45,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          sizeBoxHeight(20),
        ],
      ),
    );
  }

  showDialogBox() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Decrease this value as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              sizeBoxHeight(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: madiumText15("Select Document"),
                ),
              ),
              Divider(
                color: Colors.blueGrey.withOpacity(0.5),
              ),
              InkWell(
                onTap: () {
                  imagePickerFromGaCa(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        size: 25,
                        color: AllColor.primaryColor,
                      ),
                      sizeBoxWidth(10),
                      bigText18("Galary")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  imagePickerFromGaCa(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: AllColor.primaryColor,
                      ),
                      sizeBoxWidth(10),
                      bigText18("Camera")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  historyWidgets() {
    return Column(
      children: [
        sizeBoxHeight(10),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
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
                              textName: "Ticket No",
                              textA: "NMC/TRNOR/23/000001",
                              textTime1: "Track"),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "Application Date",
                            textA: "22-12-2023",
                          ),
                          commonMessageTitle(
                            conntainerColor: AllColor.lightorangee,
                            textName: "OR Title",
                            textA: "Account OR",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: madiumText15("Tap to view details",
                                  color: AllColor.green),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  trackwidget() {
    return Column(
      children: [
        sizeBoxHeight(8),
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
                    hintText: 'Please Enter Ticket Number',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
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
                      "TRACK",
                      color: AllColor.white,
                    ),
                  )),
            ),
            sizeBoxWidth(8)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: sizeWidth,
            // height: sizeWidth,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    madiumText15("OR Title Establishment OR"),
                    madiumText15("Ticket Number: NMC/TRNOR/24/000041"),
                    madiumText15("Application Date: 2024-02-20"),
                    madiumText15("Discription: desh"),
                    madiumText15("Pending At: JUNIOR CLERK"),
                  ],
                ),
              ),
            ),
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
            width: sizeWidth * 0.35,
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
            width: sizeWidth * 0.55,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: sizeWidth * 0.2,
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            // color: AllColor.greyColor,
            child: normalTextAppBar(textName,
                fontSize: 16.0, color: AllColor.white),
          ),
          Spacer(),
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
              width: sizeWidth * 0.2,
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              // color: AllColor.greyColor,
              child: Row(
                children: [
                  normalTextAppBar(textTime1,
                      fontSize: 16.0, color: AllColor.white),
                  Icon(
                    Icons.history,
                    color: AllColor.white,
                  )
                ],
              )),
        ],
      ),
    );
  }
}

// class Job with CustomDropdownListFilter {
//   final String name;
//   final IconData icon;
//   const Job(this.name, this.icon);

//   @override
//   String toString() {
//     return name;
//   }

//   @override
//   bool filter(String query) {
//     return name.toLowerCase().contains(query.toLowerCase());
//   }
// }
