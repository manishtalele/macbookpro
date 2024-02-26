import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
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
List<File> _imageFiles = [];

class OrRequestSelf extends StatefulWidget {
  OrRequestSelf({super.key});

  @override
  State<OrRequestSelf> createState() => _OrRequestSelfState();
}

class _OrRequestSelfState extends State<OrRequestSelf> {
  String dropdownValueORT = SelectORTypeList.first;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
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
                applyWidget(),
                historyWidgets(),
                trackwidget()
              ]),
            ),
          ],
        ),
      ),
    );
  }

  applyWidget() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "OR Type",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: sizeWidth * 0.6,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AllColor.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          focusColor: AllColor.blueGrey.withOpacity(0.1),
                          value: dropdownValueORT,
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
                              dropdownValueORT = value!;
                            });
                          },
                          items: SelectORTypeList.map<DropdownMenuItem<String>>(
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
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Sevarth No",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("DGPGSGM7001")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Designation",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("DGPGSGM7001")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Unit",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("NNAVI MUMBAI CITY")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "SUB Unit",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("CBD BELAPUR PS")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Date",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("20-02-2024")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Title",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              right: 0, left: 0, bottom: 12, top: 0),
                          border: InputBorder.none,
                        ),
                      )),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Required OR of",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Required OR of",
                          contentPadding: EdgeInsets.only(
                              right: 0, left: 0, bottom: 12, top: 0),
                          border: InputBorder.none,
                        ),
                      )),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Designation",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      width: sizeWidth * 0.6,
                      height: 38,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AllColor.primaryColor)),
                      child: madiumText15("DGPGSGM7001")),
                ),
              ],
            ),
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                bigText18(
                  "Forward To Unit",
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: sizeWidth * 0.6,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AllColor.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          focusColor: AllColor.blueGrey.withOpacity(0.1),
                          value: dropdownValueORT,
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
                              dropdownValueORT = value!;
                            });
                          },
                          items: SelectORTypeList.map<DropdownMenuItem<String>>(
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
          ),
          sizeBoxHeight(10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                TextSize25("Forward To \nSubUnit",
                    textAlign: TextAlign.left, fontSize: 18.0

                    // sizeWidth * 0.042
                    ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: sizeWidth * 0.6,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AllColor.primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          focusColor: AllColor.blueGrey.withOpacity(0.1),
                          value: dropdownValueORT,
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
                              dropdownValueORT = value!;
                            });
                          },
                          items: SelectORTypeList.map<DropdownMenuItem<String>>(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                SizedBox(
                  width: sizeWidth * 0.4,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        _imageFiles.isEmpty
                            ? TextSpan(
                                text: 'Attachment',
                                style: TextStyle(
                                    color: AllColor.black, fontSize: 16))
                            : TextSpan(
                                text: 'File Attached : ${_imageFiles.length}',
                                style: TextStyle(
                                    color: AllColor.green, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialogBox();
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
                          "BROWSE",
                          color: AllColor.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
          sizeBoxHeight(30.0),
          InkWell(
            onTap: () {},
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
                    "SUBMIT",
                    color: AllColor.white,
                  ),
                )),
          ),
          sizeBoxHeight(15.0),
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
