import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> SelectIGRMChannellist = <String>[
  'Select Chanel',
  'Call(Voice)',
  'Email',
  'Letter/Applicat'
];

class IGRMAppSource extends StatefulWidget {
  const IGRMAppSource({super.key});

  @override
  State<IGRMAppSource> createState() => _IGRMAppSourceState();
}

class _IGRMAppSourceState extends State<IGRMAppSource> {
  String dropdownValueIGRM = SelectIGRMChannellist.first;
  double spacewidget = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AllColor.white,
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
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        // color: AllColor.blue,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: sizeWidth * 0.45,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "CANCEL",
                        color: AllColor.white,
                      ),
                    )),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: sizeWidth * 0.45,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: AllColor.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: AllColor.black.withOpacity(0.5))),
                    child: Center(
                      child: madiumText15(
                        "SUBMIT",
                        color: AllColor.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: sizeHeight * 0.9,
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
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: bigText18("Appliocation Source",
                      color: AllColor.black.withOpacity(0.7)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: sizeWidth,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        focusColor: AllColor.blueGrey.withOpacity(0.1),
                        value: dropdownValueIGRM,
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
                            dropdownValueIGRM = value!;
                          });
                        },
                        items:
                            SelectIGRMChannellist.map<DropdownMenuItem<String>>(
                                (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: madiumText15(value));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Applicant Name"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Applicant Number"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Applicant Address"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Non Applicant Name"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Non Applicant Number"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Non Applicant Address"),
              sizeBoxHeight(spacewidget),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: bigText18("Incidence:",
                            color: AllColor.black.withOpacity(0.7)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: sizeWidth * 0.5,
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
                            value: dropdownValueIGRM,
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
                                dropdownValueIGRM = value!;
                              });
                            },
                            items: SelectIGRMChannellist.map<
                                DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: madiumText15(value));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Description"),
              sizeBoxHeight(spacewidget),
              applicationSourceText(lebelText: "Area/Village"),
              // sizeBoxHeight(8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: bigText18("Priority:",
                            color: AllColor.black.withOpacity(0.7)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: sizeWidth * 0.5,
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
                            value: dropdownValueIGRM,
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
                                dropdownValueIGRM = value!;
                              });
                            },
                            items: SelectIGRMChannellist.map<
                                DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: madiumText15(value));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              applicationSourceText(lebelText: "Remark"),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: bigText18("Attachment",
                            color: AllColor.black.withOpacity(0.7)),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                            width: sizeWidth * 0.45,
                            height: 35,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: AllColor.primaryColor,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: AllColor.black.withOpacity(0.5))),
                            child: Center(
                              child: madiumText15(
                                "Browse",
                                color: AllColor.white,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),

              sizeBoxHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  applicationSourceText(
      {String AppNName = "",
      TextEditingController? conntrolerText,
      lebelText}) {
    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 6, bottom: 4),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child:
        //         madiumText15(AppNName, color: AllColor.black.withOpacity(0.7)),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 38,
            child: TextField(
              controller: conntrolerText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AllColor.backgroundTop,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                // prefixIcon: Padding(
                //   padding: EdgeInsets.only(bottom: 3.0),
                //   child: IconButton(
                //     onPressed: () {
                //       setState(() {});
                //     },
                //     icon: const Icon(
                //       Icons.calendar_month,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.only(bottom: 3.0),
                //   child: IconButton(
                //     onPressed: () {
                //       setState(() {});
                //     },
                //     icon: const Icon(
                //       Icons.error_outline,
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
                labelText: lebelText,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hoverColor: Color.fromRGBO(54, 54, 54, 1),
                // hintText: 'Type Name',
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
}
