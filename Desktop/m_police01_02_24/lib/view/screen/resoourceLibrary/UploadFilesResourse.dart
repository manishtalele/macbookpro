import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/utils/dateFormatter/dateFormater.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

const List<String> SelectCategoryList = <String>[
  'Select Category',
  'Video',
  'Images',
  'Audio',
  'Document',
];

class UploadFilesResource extends StatefulWidget {
  const UploadFilesResource({super.key});

  @override
  State<UploadFilesResource> createState() => _UploadFilesResourceState();
}

class _UploadFilesResourceState extends State<UploadFilesResource> {
  DateTime? selectedfromdate;
  String dropdownCategory = SelectCategoryList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(
          bigText18(
            "Upload Files",
            color: AllColor.white,
          ), onPressed: () {
        Navigator.pop(context);
      }, centerTitle: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            sizeBoxHeight(8),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: bigText18("Category", color: AllColor.primaryColor),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: sizeWidth,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AllColor.primaryColor)),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      focusColor: AllColor.blueGrey.withOpacity(0.1),
                      value: dropdownCategory,
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
                          dropdownCategory = value!;
                        });
                      },
                      items: SelectCategoryList.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: madiumText15(value));
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxHeight(8),
            applicationSourceText(lebelText: "Document No"),
            sizeBoxHeight(8),
            InkWell(
              onTap: () {
                _selectDate();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                    width: sizeWidth,
                    height: 35,
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
                                    : formatter.format(DateTime.parse(
                                        DateTime.now().toString())),
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
            ),
            sizeBoxHeight(8),
            applicationSourceText(lebelText: "Subject"),
            sizeBoxHeight(8),
            applicationSourceText(lebelText: "Description"),
            sizeBoxHeight(8),
            applicationSourceText(lebelText: "Document Issued By"),
            sizeBoxHeight(8),
            applicationSourceText(lebelText: "Referennce By"),
            sizeBoxHeight(30),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: sizeWidth * 0.4,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Attachment',
                              style: TextStyle(
                                  color: AllColor.black, fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                  // sizeBoxWidth(45),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showDialogBox();
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
                            "BROWSE",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(30),
            Container(
                width: sizeWidth * 0.3,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: madiumText15(
                    "Upload",
                    color: AllColor.white,
                  ),
                )),
            sizeBoxHeight(30),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
      });
    }
  }

  late File _imageFiles;
  ImagePicker picker = ImagePicker();
  imagePickerFromGaCa(source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFiles = File(pickedFile.path);
      });

      log("check image file:-" + _imageFiles.toString());
    }
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

  applicationSourceText(
      {String AppNName = "",
      TextEditingController? conntrolerText,
      lebelText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 38,
        child: TextField(
          controller: conntrolerText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AllColor.primaryColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AllColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            labelText: lebelText,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            hoverColor: Color.fromRGBO(54, 54, 54, 1),
            labelStyle:
                TextStyle(fontSize: 15, color: AllColor.black.withOpacity(0.8)),
          ),
        ),
      ),
    );
  }
}
