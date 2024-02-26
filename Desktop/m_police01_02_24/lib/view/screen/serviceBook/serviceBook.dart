import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/serviceBook/serviceBookList.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class ServiceBook extends StatefulWidget {
  const ServiceBook({super.key});

  @override
  State<ServiceBook> createState() => _ServiceBookState();
}

class _ServiceBookState extends State<ServiceBook> {
  String _radioValue1 = AllString.radioBTNOwn;
  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();
  final List<String> items = [
    'Accounnt',
    'Correspondence',
    'Departmental Enquiry',
  ];
  void handleRadioValueChange1(value) {
    setState(() {
      log(value.toString());
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Service Book",
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
          Row(
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return AllColor.primaryColor;
                      }),
                      value: AllString.radioBTNOwn,
                      groupValue: _radioValue1,
                      onChanged: handleRadioValueChange1,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        handleRadioValueChange1(AllString.radioBTNOwn);
                      },
                      child: TextSize20(AllString.radioBTNOwn))
                ],
              ),
              sizeBoxWidth(100.0),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return AllColor.primaryColor;
                      }),
                      value: AllString.radioOther,
                      groupValue: _radioValue1,
                      onChanged: handleRadioValueChange1,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        handleRadioValueChange1(AllString.radioOther);
                      },
                      child: TextSize20(AllString.radioOther))
                ],
              ),
            ],
          ),
          _radioValue1 == AllString.radioBTNOwn
              ? ownServiceBook()
              : otherServiceBook()
        ],
      ),
    );
  }

  ownServiceBook() {
    return Column(
      children: [
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
                    // label: madiumText15("GIRIDHAR SITARAM GORE"),

                    hintText: "GIRIDHAR SITARAM GORE",
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

                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        const ServiceBookList()));
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
                      "Go",
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

  otherServiceBook() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  width: sizeWidth * 0.46,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      // color: AllColor.primaryDeepColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AllColor.greyColor)),
                  child: Center(
                    child: madiumText15(
                      "NAVI MUMBAI CITY",
                      color: AllColor.black,
                    ),
                  )),
              Spacer(),
              Container(
                  width: sizeWidth * 0.46,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      // color: AllColor.primaryDeepColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AllColor.greyColor)),
                  child: Center(
                    child: madiumText15(
                      "",
                      color: AllColor.black,
                    ),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: sizeWidth * 0.6,
                height: 42,
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
                        // textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                    width: sizeWidth * 0.3,
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: AllColor.primaryDeepColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: madiumText15(
                        "Go",
                        color: AllColor.white,
                      ),
                    )),
              ),
              sizeBoxWidth(8)
            ],
          ),
        ),
      ],
    );
  }
}
